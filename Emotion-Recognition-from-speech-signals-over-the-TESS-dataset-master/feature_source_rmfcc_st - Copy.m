%this function gives the features
%RMFCC+ENERGY+centroid+ENTROPY+ROLLOFF...


function [p1]=feature_source_rmfcc_st(wav,fs)
[residual,LPCoeffs] = LPresidual_v4(wav,320,160,10,1,6,0);
[MFCC2] = mfcc_rasta_delta_pkm_v1(residual,fs,13,40,20,10,1,1,1);
rmfcc=mean(MFCC2);
statistics={'mean','std'};
Features = stFeatureExtraction(residual,fs,0.02,0.01);
[mtFeatures]=mtFeatureExtraction(Features,2.0,1.0,statistics);
mtf=mtFeatures';
mt=mean(mtf);
p=[rmfcc mt];
p1=p';