function [p1]=feature_source_mean(wav,fs)

% calculating IF,SE and STE
%The feature vector is made by taking the mean length of total gci among 
...all the dialects so padding is done)

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
    ste(i)=abs(slope(i)-slope(i+4));
end

for j=1:length(gci)-1
    frequency(j)=fs/(gci(j+1)-gci(j));
end
% IF=mean(frequency);

z1=zeros(1,6335);
z2=zeros(6331,1);
z3=zeros(6334,1);
if length(gci)>6335
    gci=gci(1:6335);
    slope=slope(1:6335);
    ste=ste(1:6331);
    frequency=frequency(1:6334);
else
    gci(numel(z1))=0;
    slope(numel(z1))=0;
    ste(numel(z2))=0;
    frequency(numel(z3))=0;
end
p=[gci' slope' ste frequency];
p1=p';
