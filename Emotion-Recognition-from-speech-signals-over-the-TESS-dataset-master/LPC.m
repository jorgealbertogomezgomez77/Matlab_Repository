[y, fs, nbits] = wavread('input.wav');
y = y./(1.01*abs(max(y)));
y = y(241:400);

N = 160;
w = hamming(N);
w = 0.54-0.46*cos(2*pi*[0:N-1].'/(N-1));
y = y.*w;

P = 10;

%y = y.';


ycorr = xcorr(y,160);


ycorr = ycorr./(abs(max(ycorr)));
A = ycorr(1:P);
r = ycorr(2:(P+1));

A = toeplitz(A);
%r = r.';
L = -inv(A)*r;
%L = L;
 
LPCoeffs(1,[1:length(L)]) = L([1:length(L)]);

y5 = mtlb_conv(y,LPCoeffs);

y5 = y5(round(P/2):length(y5)-round(P/2)-1);

figure;

suplot(2,1,1); plot(y);
xtitle('voiced');
subplot(2,1,2); plot(y5);
xtitle('LP Residual');
