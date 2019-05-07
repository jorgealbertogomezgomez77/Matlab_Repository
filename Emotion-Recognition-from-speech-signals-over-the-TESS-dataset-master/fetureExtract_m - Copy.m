function [midFeatures]=fetureExtract_m(curFileName,stWin,stStep,mtWin,mtStep,listOfStatistics)
[x,fs]=audioread(curFileName);
disp(curFileName);
% if(fs>16000 && fs==44100)
 x=resample(x,16000,fs);
 disp(fs);
 Fs=16000;
% end
 if (size(x,2)>1)
 x = (sum(x,2)/2); 
 end
 % convert to MONO
%  x = x./(abs(max(x)));
%  x = x./(abs(max(x)));
%  % stFeatures1=[];
% % stFeatures2=[];
 
% %stFeatures1=stFeatureExtractionmfcc(x,fs,stWin,stStep);
 stFeatures1=mfcc_rasta_delta_pkm_v1(x,Fs,13,40,stWin*1000,stStep*1000,1,1,1);
% stFeatures2=stFeatureExtraction_pez(x,Fs,stWin,stStep);
% stFeatures2=stFeatureExtraction_SJ(x,Fs,stWin,stStep);
%  stFeatures2=stFeatureExtraction_ALL(x,fs,stWin,stStep);
% stFeatures3=stFeatureExtraction_pit68(x,Fs,stWin,stStep);

stFeatures2=feature_epoch(ghf);

gbl=stFeatures2;
stFeatures3=stFeatureExtraction_chroma(x,Fs,stWin,stStep);
% % % % % % stFeatures2=stFeatureExtraction_chroma(x,fs,stWin,stStep);
%   stFeatures4=stFeatureExtraction_formNEW(x,fs,stWin,stStep);
%   stFeatures=[stFeatures1';stFeatures2;stFeatures4];
% stFeatures=[stFeatures1';stFeatures2;stFeatures4];
 stFeatures=[stFeatures1';stFeatures3];
mtFeatures=mtFeatureExtraction(stFeatures,mtWin,mtStep,listOfStatistics);
% %ltFeatures=ltFeatureExtraction(stFeatures,ltWin,ltStep)
midFeatures=mtFeatures;
% % longFeatures=ltFeatures
% % stFeature=stFeature
end
