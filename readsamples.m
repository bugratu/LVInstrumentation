function [VLCData,RFData,Scenario,wlength,NWaveform]=readsamples(fname);
PureSurface=TDMS_readTDMSFile(fname);
VLCData=PureSurface.data{1,6};
RFData=PureSurface.data{1,7};
if isempty(VLCData)==1 | (VLCData(2)-VLCData(1)==8.000000106811456e-10)==1 |(VLCData(2)-VLCData(1)==7.999999968033578e-10)==1;
    VLCData=PureSurface.data{1,4};
else
    VLCData=PureSurface.data{1,6};
end
    
Scenario=PureSurface.propValues{1,1}{1,3};
VLCData=VLCData-mean(VLCData);
RFData=RFData-mean(RFData);
Rs=0.5e-6;
Fs=1/1.25e9;
wlength=127*Rs/Fs;
NWaveform=(length(RFData)/wlength);
end