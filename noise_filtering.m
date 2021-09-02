clear all
clc
[FileName, PathName] = uigetfile('*.wav', 'Select an audio file:');
File = fullfile(PathName, FileName);
[x,fs,bits] = wavread(File);
t = 0 : 1/fs : (length(x)-1)/fs;
[b,a] = butter(10,2000/(fs/2),'low');
figure;
plot(t,x,'LineWidth',2);
set(gca, 'unit', 'pixel');
axisPos=get(gca, 'position');
uicontrol('string', 'Play', 'position', [axisPos(1:2), 60, 20], 'callback', 'sound(x,fs)');
xlabel('t'); ylabel('x(t)'); title('Original Signal');
y = filter(b,a,x);
figure;
plot(t,y);
set(gca, 'unit', 'pixel');
axisPos=get(gca, 'position');
uicontrol('string', 'Play', 'position', [axisPos(1:2), 60, 20], 'callback', 'sound(y,fs)');
xlabel('t'); ylabel('y(t)'); title('LowPass Filtered Signal');
[d,c] = butter(10,4000/(fs/2),'high');
z = filter(d,c,x);
figure;
plot(t,z,'LineWidth',2);
xlabel('t'); ylabel('z(t)'); title('HighPass Filtered Signal');
set(gca, 'unit', 'pixel');
axisPos=get(gca, 'position');
uicontrol('string', 'Play', 'position', [axisPos(1:2), 60, 20], 'callback', 'sound(z,fs)');
