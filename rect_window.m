function [trunc_t, windowed_signal] = rect_window(x, truncation_time, T, fs)

[t, rect] = rect_generator(truncation_time, truncation_time, fs);
window_start = 1; 
window_end = truncation_time*fs;
trunc_t = (window_start : window_end); 
truncated_signal = x(trunc_t);
windowed_signal = truncated_signal .* rect;


end