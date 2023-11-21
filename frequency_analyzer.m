
function [n, signal_padded] = frequency_analyzer(signal, fs, resol, window, overlap_percent)

T = length(signal)/fs; % gives signal initial duration

%% 1. Truncate via windowing (hann, hamming, rect)
truncation_time = T/2; % DOF : i chose to just to cut at half of the signal

if window =="rect"
   [trunc_t, windowed_signal] = rect_window(signal, truncation_time, truncation_time, fs);
    
end

if window=="hann"
   [trunc_t, windowed_signal] = hann_window(signal, truncation_time, T, fs);
end 

if window=="hamming"
[trunc_t, windowed_signal] = hamming_window(signal, truncation_time, T, fs);
end 

% plot the truncated signal
figure('Name', 'Truncated signal')
plot(trunc_t, windowed_signal);


%% 2. Adjust the frequency resolution by zero padding 
n = fs/resol; 
signal_padded = zero_padding(windowed_signal, n);

%% 3. Plot DFT and STFT
window_length = 100; %DOF : amount of samples per chunk of time
[X, frequencies] = make_spectrum(signal_padded, fs);
[S, F, T] = stft(signal_padded, window_length, overlap_percent, fs);
end 


