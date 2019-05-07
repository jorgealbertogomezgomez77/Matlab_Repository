[x1, fs1] = audioread('C1.wav');
[x2, fs2] = audioread('C2.wav');
[x3, fs3] = audioread('C3.wav');
[x4, fs4] = audioread('C4.wav');
[x5, fs5] = audioread('C5.wav');
[x6, fs6] = audioread('C6.wav');
[x7, fs7] = audioread('C7.wav');
[x8, fs8] = audioread('C8.wav');
[x9, fs9] = audioread('C9.wav');

[zfSig1, gci1, slope1]=epochExtract_3(x1, fs1);
[zfSig2, gci2, slope2]=epochExtract_3(x2, fs2);
[zfSig3, gci3, slope3]=epochExtract_3(x3, fs3);
[zfSig4, gci4, slope4]=epochExtract_3(x4, fs4);
[zfSig5, gci5, slope5]=epochExtract_3(x5, fs5);
[zfSig6, gci6, slope6]=epochExtract_3(x6, fs6);
[zfSig7, gci7, slope7]=epochExtract_3(x7, fs7);
[zfSig8, gci8, slope8]=epochExtract_3(x8, fs8);
[zfSig9, gci9, slope9]=epochExtract_3(x9, fs9);

[residual1,LPCoeffs1]=LPresidual_v4(x1,320,160,10,1,6,0);
[residual2,LPCoeffs2]=LPresidual_v4(x2,320,160,10,1,6,0);
[residual3,LPCoeffs3]=LPresidual_v4(x3,320,160,10,1,6,0);
[residual4,LPCoeffs4]=LPresidual_v4(x4,320,160,10,1,6,0);
[residual5,LPCoeffs5]=LPresidual_v4(x5,320,160,10,1,6,0);
[residual6,LPCoeffs6]=LPresidual_v4(x1,320,160,10,1,6,0);
[residual7,LPCoeffs7]=LPresidual_v4(x7,320,160,10,1,6,0);
[residual8,LPCoeffs8]=LPresidual_v4(x8,320,160,10,1,6,0);
[residual9,LPCoeffs9]=LPresidual_v4(x9,320,160,10,1,6,0);

z1=zfSig1(2001:9000);
z2=zfSig2(2001:9000);
z3=zfSig3(2001:9000);
z4=zfSig4(2001:9000);
z5=zfSig5(2001:9000);
z6=zfSig6(2001:9000);
z7=zfSig7(2001:9000);
z8=zfSig8(2001:9000);
z9=zfSig9(2001:9000);
        figure;
        subplot(9,1,1);
        plot(z1); axis tight
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('ZF Signal')
        subplot(9,1,2);
        plot(z2); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,3);
        plot(z3); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,4);
        plot(z4); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,5);
        plot(z5); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,6);
        plot(z6); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,7);
        plot(z7); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,8);
        plot(z8); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,9);
        plot(z9); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
lp1=residual1(2001:9000);
lp2=residual2(2001:9000);
lp3=residual3(2001:9000);
lp4=residual4(2001:9000);
lp5=residual5(2001:9000);
lp6=residual6(2001:9000);
lp7=residual7(2001:9000);
lp8=residual8(2001:9000);
lp9=residual9(2001:9000);

        figure;
        subplot(9,1,1);
        plot(lp1); axis tight
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('LP Residual')
        subplot(9,1,2);
        plot(lp2); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,3);
        plot(lp3); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,4);
        plot(lp4); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,5);
        plot(lp5); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,6);
        plot(lp6); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,7);
        plot(lp7); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,8);
        plot(lp8); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,9);
        plot(lp9); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        
x1=x1(2001:9000);
x2=x2(2001:9000);
x3=x3(2001:9000);
x4=x4(2001:9000);
x5=x5(2001:9000);
x6=x6(2001:9000);
x7=x7(2001:9000);
x8=x8(2001:9000);
x9=x9(2001:9000);
        figure;
        subplot(9,1,1);
        plot(x1); axis tight
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('Original')
        subplot(9,1,2);
        plot(x2); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,3);
        plot(x3); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,4);
        plot(x4); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,5);
        plot(x5); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,6);
        plot(x6); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,7);
        plot(x7); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,8);
        plot(x8); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');
        subplot(9,1,9);
        plot(x9); axis tight
%         xlabel('Time (s)');
%         ylabel('Amplitude');

x=x1(3001:6200);
z=z1(3001:6200);
lp=lp1(3001:6200);
figure;
        subplot(3,1,1);
        plot(x); axis tight
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('Original')
        subplot(3,1,2);
        plot(z); axis tight
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('ZF Signal')
        subplot(3,1,3);
        plot(lp); axis tight
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('LP Residual')
        