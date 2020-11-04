clear all
close all
% addpath(genpath('D:\Reflection_Meas\Surface'));
% addpath(genpath('E:\Reflection'));
% addpath(genpath('E:\Reflection\AWG\Vehicle'));
fname='REF_010.tdms'; %%REF_024,22 problematic?
[VLCData,RFData,Scenario,wlength,NWaveform]=readsamples(fname);
[CIR,CIRn,lag,lagn,lag0, mag0]=CIRcalc(NWaveform,wlength,RFData,VLCData);
x=lag0';
gaussEqn = 'a1*exp(-((x-b1)/c1).^2)' ;
startpoints=[9 300 220];
f1=fit(x,mag0',gaussEqn,'start',startpoints);
plot(lag0,mag0)
hold on
plot((gaussCIR(f1.a1,f1.b1,f1.c1,lag0)))
legend('Measured','Gauss Fitted')
axis tight
grid on
Scenario=Scenario(1:12);
Scenario=convertCharsToStrings(Scenario); 
title([Scenario])