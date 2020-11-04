function [CIR,CIRn,lag,lagn, lag0, mag0] = CIRcalc(NWaveform,wlength,RFData,VLCData)

CIR=[];
CIRn=[];
n=1;
lag=[];
lagn=[];
for i=1:wlength:(NWaveform-1)*wlength %Valid after 007 , phase alignment, 8-11 valid for bumper reflections, 240 waveforms, 15V 0.374A Current, 60degree led 42degree pd 
%% Find start of the sequence, from Waveform_Data_9 ,29 to last walll reflection, 34 to last los
[CIR(n,:), lag(n,:)]=xcorr(VLCData(i:i+wlength),RFData(i:i+wlength));
[CIRn(n,:), lagn(n,:)]=xcorr(VLCData(i:i+wlength),RFData(i:i+wlength),'normalized');
n=n+1;
end

lag0i=find(lag(1,:)==0);
lag0=lag(1,lag0i:lag0i+2000);
mag0=mean(CIR,1);
mag0=mag0(1,lag0i:lag0i+2000);

end