function [p1]=feature_source_min_rmfcc_md(wav,fs)

%this function gives the features
%EPOCH_LOCATIONS+RMFCC+CENTROID+ROLLOFF+ENERGY+ENTROPY+SE+SSE+IF....


% calculating IF,SE and STE
%The feature vector is made by taking the lowest length of gci among all the
...dialects so no padding is done)

%IF(Instantaneous Frequency is calculated as reciprocal of the absolute
...difference between 2 consecutive epoch locations with respect to time)
...and after that the mean of all the frequencies is taken as the
...instantaneous frequency)
    
%SE(Strength of epoch) is taken to be the slope os the zf signal)

%STE(Slope of strength of epoch) to calculate it,The window of 5 
...consecutive epoch strengths is considered, thedifference between the 
...first and the last values gives the slope.)

[zfSig, gci, slope]=epochExtract_3(wav,fs);
slope=slope(1:284);
for i=1:length(slope)-4
    ste(i)=abs(slope(i)-slope(i+4));
end
gci=gci(1:284);
for j=1:length(gci)-1
    frequency(j)=fs/(gci(j+1)-gci(j));
end
% IF=mean(frequency);
% gci=gci(1:284);
[residual,LPCoeffs] = LPresidual_v4(wav,320,160,10,1,6,0);
[MFCC2] = mfcc_rasta_delta_pkm_v1(residual,fs,13,40,20,10,1,1,1);
mfcc=mean(MFCC2);
statistics={'mean','std'};
Features = stFeatureExtraction(residual,fs,0.02,0.01);
[mtFeatures]=mtFeatureExtraction(Features,2.0,1.0,statistics);
mtf=mtFeatures';
mt=mean(mtf);
p=[gci' slope' ste frequency mfcc mt];
p1=p';