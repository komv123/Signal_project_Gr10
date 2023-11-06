close all
clear all
clc


freq=[1000 3000];
fs=20000;
order=4;
type='bp';
approx = 'butterworth';

[B,A]=Filtergenerator(approx,order,type,freq,fs);
[h,t]=impz(B,A,1e6);
plot(t,h)





%xlim([0.1 0.11])



%If we want an FIR, we have to do this :



