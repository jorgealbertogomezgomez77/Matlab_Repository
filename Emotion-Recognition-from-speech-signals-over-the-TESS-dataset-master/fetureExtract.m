function [midFeatures]=fetureExtract(curFileName,stWin,stStep,mtWin,mtStep,listOfStatistics)
[x,fs]=audioread(curFileName);
% stFeatures=stFeatureExtraction_mm(x,fs,stWin,stStep);
stFeatures=stFeatureExtraction(x,fs,stWin,stStep);

mtFeatures=mtFeatureExtraction(stFeatures,mtWin,mtStep,listOfStatistics);
%ltFeatures=ltFeatureExtraction(stFeatures,ltWin,ltStep)
midFeatures=mtFeatures;
% longFeatures=ltFeatures
% stFeature=stFeatures