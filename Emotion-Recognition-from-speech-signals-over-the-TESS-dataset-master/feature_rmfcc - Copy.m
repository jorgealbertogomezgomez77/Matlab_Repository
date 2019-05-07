%this function gives the RMFCC features


function [rmfcc]=feature_rmfcc(wav,fs)
[residual,LPCoeffs] = LPresidual_v4(wav,320,160,10,1,6,0);
[MFCC2] = mfcc_rasta_delta_pkm_v1(residual,fs,13,40,20,10,1,1,1);
mfcc=mean(MFCC2);
rmfcc=mfcc';