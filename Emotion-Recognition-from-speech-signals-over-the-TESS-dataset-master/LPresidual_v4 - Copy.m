
%**************************************************************************
function [residual,LPCoeffs] = LPresidual_v4(speech,framesize,frameshift,lporder,preempflag,a,plotflag)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUTS :

%		speech      - speech in ASCII
%		framesize   - framesize for lpanalysis (samples)
%		frameshift  - frameshift for lpanalysis (samples)
%		lporder     - order of lpc
%		preempflag  - If 0 do preemphasis
%       a           - preemphasis filter coefficient
%		plotflag    - If 1 plot results

%  OUTPUTS :

%		residual   - residual signal
%		LPCoeffs   - 2D array containing LP coeffs of all frames

% This matlab function generates LPresidual by inverse filtering. The inverse filter coefficients are obtained by LPanalysis.

% NOTE: To eliminate (lporder+1) poorly predicted samples in the begining of each frame, we need to consider overlapping frames for analysis.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% METHOD: 

%	-Consider one frame at a time, compute LP coefficients, pass orginal frame thro' inverse filter to get corresponding reisdual frame.

%	-Consider only FRAMESHIFT number of samples among the total  FRAMESIZE number of samples.

%	-Repeat same procedure for all the frames.

%	-In the end, hamming window lporder number of samples of the first frame 

%	 to eliminate initial poorly predicted samples.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% PREEMPHASIZING SPEECH SIGNAL

%disp('------------------------ LP RESIDUAL ------------------------')

if(preempflag==0)
prespeech=preemphasis(speech,a);
else
prespeech=speech;
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%COMPUTING RESIDUAL
residual = zeros(1,length(speech));

%NUMBER OF FRAMES
nframes=floor((length(speech)-framesize)/frameshift)+1;
LPCoeffs=zeros(nframes,(lporder+1));
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

j=1;

for i=1:frameshift:(length(speech)-framesize)

	SpFrm = speech(i:i+framesize-1);                    % SPEECH FRAME
    
    preSpFrm =prespeech(i:i+framesize-1);               % PREEMPHASISED SPEECH FRAME
    
    lpcoef = lpc(hamming(length(preSpFrm)).*preSpFrm,lporder);

	LPCoeffs(j,:)=real(lpcoef);

	
        if(i<=lporder)
               PrevFrm=zeros(1,lporder);
        else
               PrevFrm=speech((i-lporder):(i-1));
        end

    
    ResFrm=ResFilter_v2(real(PrevFrm),real(SpFrm),real(lpcoef),lporder,framesize,0);

    j=j+1;

	residual(i:i+frameshift-1)=ResFrm(1:frameshift);                             % CONSIDER ONLY RESIDUAL UPTO FRAME SHIFT 

      
  end
	
  residual(i+frameshift:i+framesize-1)=ResFrm(frameshift+1:framesize);            % FOR LAST FRAME

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%PROCESSING LASTFRAME SAMPLES

if(i<length(speech))

	    SpFrm = speech(i:length(speech));
        
        preSpFrm =prespeech(i:length(prespeech));

        lpcoef = lpc(hamming(length(preSpFrm)).*preSpFrm,lporder);

        LPCoeffs(j,:)=real(lpcoef);

        PrevFrm=speech((i-lporder):(i-1));

        ResFrm=ResFilter_v2(real(PrevFrm),real(SpFrm),real(lpcoef),lporder,framesize,0);

        j=j+1;

        residual(i:i+length(ResFrm)-1)=ResFrm(1:length(ResFrm));

end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%TT=residual(i+length(ResFrm):end);
%residual(i+length(ResFrm):end)=residual(i+length(ResFrm)-1);
%residual(i+length(ResFrm):end)=residual(i+length(ResFrm):end).*hamming(length(TT))';

hm=hamming(2*lporder);

for(i=1:length(hm)/2)

	residual(i)=residual(i)*hm(i);      %attenuating first lporder samples

end
residual=residual';
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%ASSIGING TO OUTPUT VARIABLES

count = length(residual);

%PLOTTING THE RESULTS

if(plotflag==1)
figure;
subplot(2,1,1)
plot(speech); axis tight
title('Original Signal')
grid;

subplot(2,1,2)
plot(real(residual));axis tight
title('LP Residual')
grid
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SOME MISTAKES IN THE PREVIOUS VERSIONS
%res  = filter(lpcoef,1,temp1); %inverse filtering
% NOTE the error in the above statement. we need to filter orginal frame, not the windowed one (temp1 is original frame).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
