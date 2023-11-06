close all
clear all
clc


freq=[1000 3000];
fs=20000;
order=4;
type='bp';
approx = 'butterworth';

[B,A]=Filtergenerator(approx,order,type,freq,fs);
impz(B,A,1e6);

T=1;
t=1/fs:1/fs:T-1/fs;
x=sin(2*pi*1500*t);

y=conv(x,h);
fs2=20999;
t=1/fs2:1/fs2:T-1/fs2;

%plot(t,y)
freqz(B,A,[],fs)

%xlim([0.1 0.11])



%If we want an FIR, we have to do this :



