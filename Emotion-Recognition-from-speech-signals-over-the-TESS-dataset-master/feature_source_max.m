function [p1]=feature_source_max(wav,fs)

% calculating IF,SE and STE
%The feature vector is made by taking the highest length of gci among all the
...dialects so padding is done)

%IF(Instantaneous Frequency is calculated as reciprocal of the absolute
...difference between 2 consecutive epoch locations with respect to time)
...and after that the mean of all the frequencies is taken as the
...instantaneous frequency)
    
%SE(Strength of epoch) is taken to be the slope os the zf signal)

%STE(Slope of strength of epoch) to calculate it,The window of 5 
...consecutive epoch strengths is considered, thedifference between the 
...first and the last values gives the slope.)

[zfSig, gci, slope]=epochExtract_3(wav, fs);
for i=1:length(slope)-4
    STE(i)=abs(slope(i)-slope(i+4));
end
for j=1:length(gci)-1
    frequency(j)=fs/(gci(j+1)-gci(j));
end
IF=mean(frequency);

p=[gci' slope' STE IF];
p1=p';
z=zeros(42231,1);
p1(numel(z))=0;
