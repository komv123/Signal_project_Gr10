close all
clear all
clc


freq=[1000 3000];
fs=20000;
order=48;
type='hp';
approx = 'butterworth';

[B,A]=IIRFiltergenerator(approx,order,type,freq,fs);
%[h,t]=impz(B,A,1e6);
%plot(t,h)

b=FIRFiltergenerator(order,type,freq,fs);
freqz(b,1,[],fs)



%xlim([0.1 0.11])



%If we want an FIR, we have to do this :



