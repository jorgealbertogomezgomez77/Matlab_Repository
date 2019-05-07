function [midFeatures]=fetureExtract_pit_68(curFileName,stWin,stStep,mtWin,mtStep,listOfStatistics)
%    curFileName='I:\database\data16\A4\8.wav';
 [y,fs]=audioread(curFileName);
    
    y=resample(y,16000,fs);
 
  disp(fs);
  Fs=16000;
   % if STEREO ...
 if (size(y,2)>1)
    y = (sum(y,2)/2); % convert to MONO
 end
%         y = y./(abs(max(y)));
% stFeatures1=stFeatureExtraction_pit(y,Fs,stWin,stStep);
%  stFeatures1=stFeatureExtractionmfcc(y,Fs,stWin,stStep);
    stFeatures1=mfcc_rasta_delta_pkm_v1(y,Fs,9,40,stWin*1000,stStep*1000,1,1,1);
%   stFeatures1=stFeatures14';
%      stFeatures2=stFeatureExtraction_SJ(y,Fs,stWin,stStep);
% %  stFeatures2=stFeatureExtraction_fep(y,Fs,stWin,stStep);
      stFeatures2=stFeatureExtraction_formNEW(y,Fs,stWin,stStep);
      stFeatures3=stFeatureExtraction_pit(y,Fs,stWin,stStep);
        stFeatures=[stFeatures1';stFeatures2;stFeatures3];
%               stFeatures=[stFeatures1';stFeatures2];
mtFeatures=mtFeatureExtraction(stFeatures,mtWin,mtStep,listOfStatistics);
%ltFeatures=ltFeatureExtraction(stFeatures,ltWin,ltStep)
midFeatures=mtFeatures;
% longFeatures=ltFeatures
% stFeature=stFeature