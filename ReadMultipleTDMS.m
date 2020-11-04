function [LabMeasurements,VLCData,RFData,Scenario] =  ReadMultipleTDMS(l)
addpath(genpath('D:\Reflection_Meas\Surface'));
addpath(genpath('D:\Reflection_Meas\Oscilloscope_Jitter\Records\TDMSMATLAB'));
addpath(genpath('E:\Reflection\AWG\Vehicle'));
index=l;
for i=1:length(index)
    j=index(i);
fname = sprintf('%s_%03d.tdms','REF',j);
LabMeasurements(i,:)=TDMS_readTDMSFile(fname);
VLCData(i,:)=LabMeasurements(i,:).data{1,6};
RFData(i,:)=LabMeasurements(i,:).data{1,7};
Scenario(i,:)=[LabMeasurements(i,:).propValues{1,1}{1,2} LabMeasurements(i,:).propValues{1,1}{1,3}];
VLCData(i,:)=VLCData(i,:)-mean(VLCData(i,:));
RFData(i,:)=RFData(i,:)-mean(RFData(i,:));
end
end