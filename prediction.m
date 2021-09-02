%clear
%clc

%% ---- THIS CODE IS TO VISUALIZE THE FEATURE EXTRACTION ON THE SIGNAL ----
% In this code the plot is not added you can add the plot code in part you want to visuallize the data 
% Choose signal from folder
[FileName, PathName] = uigetfile('*.wav', 'Select an audio file:');
File = fullfile(PathName, FileName);
y = wavread(File);
% Set the sampling and end point 
fs=8000;
t = 0:1/fs:(length(y) - 1)/fs;
% Pre-emphasis
left= y(:,1);
a=0.9;
y2 = filter([1, -a], 1, y);
% low pass filter
[b,a] = butter(10,2000/(fs/2),'low');
data = filter(b,a,y2);

%% --- Computing MFCC Co-efficients---
%% (1) Frame Blocking..
N = 512;   % N point FFT
M = 256;   % Overlapping

NN = floor(N/2+1); %N/2
nbFrames = ceil((length(data)-N)/M);
Frames = zeros(nbFrames+1,N);
for i = 0:nbFrames-1
    temp = data(i*M+1:i*M+N);
    Frames(i+1,1:N) = temp; 
end

% Last Frame..
temp = zeros(1,N); 
lastLength = length(data)- nbFrames*M;
temp(1:lastLength) = data(nbFrames*M+1:(nbFrames*M +1 + lastLength-1));  
Frames(nbFrames+1, 1:N) = temp;
%% (2) Windowing..
frameSize = size(Frames); 
nbFrames = frameSize(1); 
nbSamples = frameSize(2); 

% Hamming window.. 
w = hamming(nbSamples); 
Windows = zeros(nbFrames,nbSamples);
for i = 1:nbFrames
    temp = Frames(i,1:nbSamples); 
    Windows(i, 1:nbSamples) = w'.*temp; 
end
%% (3) Fourier Transform..
ffts = fft(Windows');
%% (4) Mel-frequency Wrapping..
% (a) Calculate Power spectrum..
PowSpecs = abs(ffts).^2;
PowSpecs = PowSpecs(1:NN-1,:);

% (b) Mel filter generation
nof_c = 20; % Number of channels..
df = fs/N;
Nmax = N/2;
fmax = fs/2;

% Convert to mel scale..
melmax = 2595*log10(1+fmax/700);
melinc = melmax/(nof_c+1);
melcenters = (1:nof_c).*melinc;

% Convert to frequency scale.. 
fcenters = 700*((10.^(melcenters./2595))-1);
centerf = round(fcenters./df);
startf = [1,centerf(1:nof_c-1)];
stopf = [centerf(2:nof_c),Nmax];
W = zeros(nof_c,Nmax);

% Making filter..
for i = 1:nof_c
    increment = 1.0/(centerf(i)-startf(i));
    for j = startf(i):centerf(i)
        W(i,j) = (j-startf(i))*increment;
    end
    decrement = 1.0/(stopf(i)-centerf(i));
    for j = centerf(i):stopf(i)
        W(i,j) = (j-centerf(i))*decrement;
    end 
end

% Normalising..
for i = 1:nof_c
    W(i,:) = W(i,:)/sum(W(i,:));
end

% (c) Apply mel filters to Power spectrum coeffs..
melPowSpecs = W*PowSpecs;

% (d) MFCC calculations..
melCeps = dct(log(melPowSpecs));
melCeps(1,:) = [];
melCeps=melCeps';
melCeps=melCeps(:)';
melCeps=melCeps';
a=melCeps(1:551);

%% Predict
YPred = net(a);

if YPred(1) >= 0.5
    msgbox('THE COMMAND IS BUKA KIPAS')
elseif YPred(2) >= 0.5
    msgbox('THE COMMAND IS TUTUP KIPAS')
elseif YPred(3) >= 0.5
    msgbox('THE COMMAND IS BUKA LAMPU')
else
    msgbox('THE COMMAND IS TUTUP LAMPU')
end