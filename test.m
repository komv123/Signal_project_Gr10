clear all
close all
clc

fs = 10000;
freq = (10:40);
t_tot = 4;
per = 0.5;

signal = generate_tone(fs, per, t_tot);

tvect = (1:length(signal))/fs;
figure('Name', "test signal")
plot(tvect,signal)