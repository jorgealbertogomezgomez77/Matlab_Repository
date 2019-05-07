function [t]=feature_GOI(wav,fs)
[zfSig, gci, slope]=epochExtract_3(wav,fs);
for i=1:length(gci)-1
    p(i)=(gci(i+1)-gci(i))/fs;
end
g=mean(p);
disp(g);
for j=2:length(gci)
    if p(j-1)<g
        t(j-1)=((gci(j)/fs)+0.3*p(j-1));
    else
        t(j-1)=((gci(j)/fs)+0.3*g);
    end
    t=t';
end
        