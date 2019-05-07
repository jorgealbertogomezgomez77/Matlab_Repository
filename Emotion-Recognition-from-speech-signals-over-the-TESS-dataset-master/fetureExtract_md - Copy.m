function [midFeatures]=fetureExtract_md(curFileName,stWin,stStep,mtWin,mtStep,listOfStatistics)
%    curFileName='I:\database\data16\A4\8.wav';
 [y,fs]=audioread(curFileName);
    
    y=resample(y,16000,fs);
 
  disp(fs);
  Fs=16000;
   % if STEREO ...
 if (size(y,2)>1)
    y = (sum(y,2)/2); % convert to MONO
 end
%y = y./(abs(max(y)));


%stFeatures1=stFeatureExtraction_pit(y,Fs,stWin,stStep);
%stFeatures1=stFeatureExtractionmfcc(y,Fs,stWin,stStep);
stFeatures=mfcc_rasta_delta_pkm_v1(y,Fs,13,40,stWin*1000,stStep*1000,1,1,1);
mtFeatures=mtFeatureExtraction(stFeatures,mtWin,mtStep,listOfStatistics);
%stFeatures1=stFeatures14';
%stFeatures2=stFeatureExtraction_SJ(y,Fs,stWin,stStep);
%%stFeatures2=stFeatureExtraction_fep(y,Fs,stWin,stStep);
%stFeatures2=stFeatureExtraction_formNEW(y,Fs,stWin,stStep);
%stFeatures3=stFeatureExtraction_m(y,Fs,stWin,stStep);
%stFeatures=[stFeatures1';stFeatures2;stFeatures3];
%stFeatures=[stFeatures1';stFeatures3];
%mtFeatures1=mtFeatureExtraction(stFeatures1',mtWin,mtStep,listOfStatistics);
%ltFeatures=ltFeatureExtraction(stFeatures,ltWin,ltStep)
midFeatures=mtFeatures;

% longFeatures=ltFeatures
% stFeature=stFeature