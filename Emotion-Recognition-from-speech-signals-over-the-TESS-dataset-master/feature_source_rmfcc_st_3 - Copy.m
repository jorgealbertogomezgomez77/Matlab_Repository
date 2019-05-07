% This function gives the features
% RMFCC+SE+SSE+IF+ENERGY+ENTROPY+CENTROID+ROLLOFF....


function [features]=feature_source_rmfcc_st_3(wav,fs)

[zfSig, gci, slope]=epochExtract_3(wav,fs);

for i=1:length(slope)-4
    ste(i)=abs(slope(i)-slope(i+4));
end

SLOPE=mean(slope);

STE=mean(ste);

for j=1:length(gci)-1
    frequency(j)=fs/(gci(j+1)-gci(j));
end

IF=mean(frequency);

%  gci=gci(1:503);

[residual,LPCoeffs] = LPresidual_v4(wav,320,160,10,1,6,0);

[MFCC2] = mfcc_rasta_delta_pkm_v1(residual,fs,13,40,20,10,1,1,1);
[MFCC3] = mfcc_rasta_delta_pkm_v1(wav,fs,13,40,20,10,1,1,1);
mfcc1=mean(MFCC2);
mfcc2=mean(MFCC3);

statistics={'mean','std'};

Features1 = stFeatureExtraction(wav,fs,0.02,0.01);
[mtFeatures1]=mtFeatureExtraction(Features1,2.0,1.0,statistics);
mtf1=mtFeatures1';
mt1=mean(mtf1);

Features2=stFeatureExtraction_mm(residual,fs,0.02,0.01);
[mtFeatures2]=mtFeatureExtraction(Features2,2.0,1.0,statistics);
mtf2=mtFeatures2';
mt2=mean(mtf2);

p=[mt1 SLOPE STE IF];
features=p';