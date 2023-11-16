function [t ramp] = rect_generator(T_0, T, fs)
t= [0:1/fs:T-1/fs];
ramp_on = ones(1,fs*T_0);                          
ramp =[ramp_on zeros(1,fix((T -T_0)*fs))];
end