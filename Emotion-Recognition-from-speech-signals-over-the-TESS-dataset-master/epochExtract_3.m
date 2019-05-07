function [zfSig, gci, slope]=epochExtract_3(wav, fs)
% function [gci]=epochExtract(wav, fs)
% Returns the pitch values for every 10 ms interval.
% zfSig is the zero frequency signal derived from speech signal.
% gci is the glottal closure instant timing in seconds.
%	[wav fs]=wavread(wavFile);
% 	wav=resample(wav,8000,fs); fs=8000;
	winLength=xcorrWinLen(wav,fs);
    disp(winLength);
%	if(fs<32000)
%		wav=resample(wav,96000,fs);
%		fs=96000;
%	end;
	zfSig=zeroFreqFilter(wav,fs,winLength);
	
	[gci, slope]=zerocros(zfSig,'p');

    

function [zfSig] = zeroFreqFilter(wav,fs,winLength)

	dwav=diff(wav);
	dwav=dwav/max(abs(dwav));
	N=length(dwav);

	%zfSig=filter(1,[1 -4 6 -4 1],dwav);
	zfSig=cumsum(cumsum(cumsum(cumsum(dwav))));
	
	winLength=round(winLength*fs/1000);
	zfSig=remTrend(zfSig,winLength);
 	zfSig=remTrend(zfSig,winLength);
 	zfSig=remTrend(zfSig,winLength);
	zfSig(N-winLength*3:N)=0;
	
function [out]=remTrend(sig,winSize)

	window=ones(winSize,1);
	rm=conv(sig,window);
	rm=rm(winSize/2:length(rm)-winSize/2);

	norm=conv(ones(length(sig),1),window);
	norm=norm(winSize/2:length(norm)-winSize/2);

	rm=rm./norm;
	out=sig-rm;

function [f,s]=zerocros(x,m)
	if nargin<2
    		m='b';
	end
	s=x>=0;
	k=s(2:end)-s(1:end-1);
	if any(m=='p')
  		f=find(k>0);
	elseif any(m=='n')
	    f=find(k<0);
	else
	    f=find(k~=0);
	end
	s=x(f+1)-x(f);

    
    
%     [x,fs]=audioread('kan_0001.wav');
% win=xcorrWinLen(x,fs);
function [idx]=xcorrWinLen(wav,fs)

	zfSig=zeroFreqFilter(wav,fs,2);
	zfSig=zfSig/max(abs(zfSig));
	wav=zfSig;

	frameSize=30*fs/1000;
	frameShift=20*fs/1000;

	en=conv(wav.^2,ones(frameSize,1));
	en=en(frameSize/2:end-frameSize/2);
	en=en/frameSize;
	en=sqrt(en);
	en=en>max(en)/5;

	b=buffer(wav,frameSize,frameShift,'nodelay');
	vad=sum(buffer(en,frameSize,frameShift,'nodelay'));

	FUN=@(x) xcorr((x-mean(x)).*hamming(length(x)),'coeff')./xcorr(hamming(length(x)),'coeff');
	out=blkproc(b,[frameSize,1],FUN);

	out=out(frameSize:end,:);
	
	minPitch=3;  %2 ms == 500 Hz.
       	maxPitch=16; %16 ms == 66.66 Hz.	

	[maxv maxi]=max(out(minPitch*fs/1000:maxPitch*fs/1000,:));

	%h=hist(maxi(vad>frameSize/2)+minPitch,(3:15)*8-4);
	x=(minPitch:0.5:maxPitch)*fs/1000+2;
	pLoc=maxi(vad>frameSize*0.8)+minPitch*fs/1000;
	y=hist(pLoc,x);
	y=y/length(pLoc);
	
	%h=figure(); 
	%bar(x,y,1,'EdgeColor',[1 1 1],'FaceColor',[0 0 0]);
	%set(gca,'xTick',(1:maxPitch)*fs/1000+0.5*fs/1000, 'xTickLabel',(1:maxPitch));
	%set(gca,'yTick',[0 0.1 0.2 0.3 0.4],'yTickLabel',[0 0.1 0.2 0.3 0.4]);
	%xlabel('Time (s)');
	%ylabel('Normalized frequency');
        %allText   = findall(h, 'type', 'text');
        %allAxes   = findall(h, 'type', 'axes');
        %allFont   = [allText; allAxes];
	%xlim([1 maxPitch+1]*fs/1000)
        %set(allFont,'FontSize',18);

	%advexpfig(h,'hist.eps','-deps2c','w',20,'h',20);

	%close(h);

	[val idx]=max(y);
	idx=round(idx/2)+minPitch+2