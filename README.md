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

- In this project there are some weaknesses need to be modified
  - The feature extraction is done manually and save in mat file to be used in ANN because the melceps give different lenght of output.
  - This is the mat file of [MFCC feature extraction](https://github.com/masyitah-abu/Malay-Command-Recognition-using-ANN/blob/main/command_feature.mat)
  - Neural network need same data size to be classified
  - <b>Please tag me if the problem can be solve.</b>:smiling_face_with_three_hearts:
 
- Specification used for this work:
  - Matlab 2014a

:no_entry: The dataset is not provided to protect personal right
