function [trunc_t, windowed_signal] = hann_window(x, T_0, T, fs)

t = 0:1/fs:T-1/fs;
window_start = 1;
window_end = T_0*fs-1;
trunc_t = (window_start : window_end);
truncated_signal = x(trunc_t);

hann_window = transpose(hann(length(truncated_signal)));

windowed_signal = truncated_signal .* hann_window;
 

end