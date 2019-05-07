function [midFeatures]=fetureExtract_form(curFileName,stWin,stStep,mtWin,mtStep,listOfStatistics)
  %[y,fs]=audioread('3.wav');
  [y1,fs]=audioread(curFileName);
  y1=resample(y1,16000,fs);
    if (size(y1,2)>1)
    y1 = (sum(y1,2)/2); % convert to MONO
    end
  
   y = y1./(1.01*abs(max(y1)));
% % y=0;
% % [y,fs]=audioread('M3.wav');
% % x2=y;
% x1=0;
% % [y fs]=wavread(fname);
%                    clear curFileName;
%                    sig=y.*y;
%           E=mean(sig);
%           Threshold=0.03*E;
%           k=1;
%           for b=1:100:(length(sig)-100)
%               if((sum(sig(b:b+100)))/100 > Threshold)
%                   dest(k:k+100)=y(b:b+100);
%                   k=k+100;
%                end;
%           end;
%           clear  FS Threshold E sig y ;
% 	              
%                    dest=dest';
% 	              
%                    if 1i==1
%                        x1=dest;
%                    else
%                       x1=vertcat(x1,dest);
%                    end;
%         clear dest;
% % 
% stFeatures1=stFeatureExtractionmfcc(y,fs,stWin,stStep);
 stFeatures2=stFeatureExtraction_form(y,fs,stWin,stStep);
%  stFeatures2=stFeatureExtraction_MFCCL(y,fs,stWin,stStep);
  stFeatures=stFeatures2;
% stFeatures=[stFeatures1;stFeatures2];
% disp(stFeatures);
mtFeatures=mtFeatureExtraction(stFeatures,mtWin,mtStep,listOfStatistics);
%ltFeatures=ltFeatureExtraction(stFeatures,ltWin,ltStep)
midFeatures=mtFeatures;
% longFeatures=ltFeatures
% stFeature=stFeatures