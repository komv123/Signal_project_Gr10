function [trunc_t, truncated_signal, windowed_signal] = hamming_window(x, T_0, T, fs)

t = 0:1/fs:T-1/fs;
window_start = 1;
window_end = T_0*fs-1;
trunc_t = (window_start : window_end);
truncated_signal = x(trunc_t);

hamming_window = transpose(hamming(length(truncated_signal)));

windowed_signal = truncated_signal .* hamming_window;
 

end