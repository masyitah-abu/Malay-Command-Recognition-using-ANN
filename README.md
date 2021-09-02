# Malay Command Recognition using ANN

- This project is to recognize the malay command given for electrical appliances
- The electrical appliance choose for this work are fan and light
- The command used are BUKA KIPAS, TUTUP KIPAS, BUKA LAMPU and TUTUP LAMPU
- The detail of this project are explain in the [REPORT](https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/tree/main/Report)

- How to used this code:
  - Step 1 : load the command_feature.mat (double click at the mat file)
  - Step 2 : run the ann_classification.m to train and validate the malay command.
    - The ANN code is generate using neural network toolbox.
    - To start the toolbox type nnstart in the command windows and choose Pattern Recognition Apps 
    - This is the step how to used [nnstart(nprtool)](https://www.mathworks.com/videos/wine-classification-with-neural-pattern-recognition-tool-68798.html)
  - Step 3 : Predict the command  

- There are several steps need to follow to recognize the malay command given.
  - First process is pre-processing process. The step for pre-processing are:
    - Choose Signal >> Pre-Emphasis >> Low Pass Filtering
<p align="center">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/MFCC_Output/Original_Signal.jpg">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/MFCC_Output/Pre-Emphasis.jpg">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/MFCC_Output/Low_Pass_Filtering.jpg">
</p>

  - Second process is feature extraction. The feature extraction used is MFCC. The step are:
    - Frame blocking + Windowing(Hamming Windowing) >> Fourier Transform >> Mel Frequency Wrapping
<p align="center">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/MFCC_Output/Windowing.jpg">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/MFCC_Output/Power_Spectrum.jpg">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/MFCC_Output/MFCC_Feature_Extraction.jpg">
</p>

  - Lastly, Classification method using ANN
    - The threshold set for command prection is 0.5 (this threshold can change based on your dataset) 
    - This is the prediction example for this signal
<p align="center">
  <img width="40%" height="40%" src= "https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/Output/prediction_output.jpg">
</p>

- In this project there are some weaknesses need to be modified
  - The feature extraction is done manually and save in mat file to be used in ANN because the melceps give different lenght of output.
  - This is the mat file of [MFCC feature extraction](https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/command_feature.mat)
  - Neural network need same data size to be classified
  - <b>Please tag me if the problem can be solve.</b>:smiling_face_with_three_hearts:
 
- Specification used for this work:
  - Matlab 2014a

:no_entry: The dataset is not provided to protect personal right

😃 The command example is provided
