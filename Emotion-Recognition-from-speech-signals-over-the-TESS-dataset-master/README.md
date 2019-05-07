# Emotion-Recognition
Emotion Recognition using matlab (Machine Learning using SVM and Random Forest)
The codes are within the folders with the name alphabetically to run any of the codes you have to unwrap all the rar files for execution.
The "reading 7 class.m" code is for the 7 class emotion classification.
The dataset used is the "TESS" in WAV format.
The emotions are classified and tested using "Weka".
The emotions are classified based on few features like -MFCC(13 features of Mel Frequency Cepstral Coeficient), Slope of strength of epoch and two other features.
The description of Models:-
Model-07--This Model is of 1400 instances of the Younger dataset of the TESS. 29 features have been used to train this model, Its testng accuracy is 97.5 using Random Forest and 78.6 using SVM with 5 Fold Cross Validation.
Model-08--This Model is of 1400 instances of the Older dataset of the TESS. 29 features have been used to train this model, Its testing accuracy is 98 using Random Forest and 81 using SVM with 5 Fold Cross Validation.
These two models help in distinguishing between the younger and older emotions.
Model-09--This Model is of 1400 instances of the Older dataset of the TESS. 10 features except the MFCC have been used to train this model. Its testing accuracy is 78 using Random Forest and 52 using SVM with 5 Fold Cross Validation.
Model-10--This Model is of 1400 instances of the Younger dataset of the TESS. 10 features except the MFCC have been used to train this model. Its testing accurayis 72 using Random Forest and 46 using SVM with 5 Fold Cross Validation.
These two models have been trained without feeding them the MFCC (13 exclusive features) Hence the accuracy is so low about the classification into 7 emotion Categories.
Originally the Data was Classified into 7 Emotion Categories (Pleasant Surprise, Angry, Disgust, Sad, Happy, Fear, Neutral) 
The link for he dataset is as follows:-  https://tspace.library.utoronto.ca/handle/1807/24487/browse?type=title&submit_browse=Title
