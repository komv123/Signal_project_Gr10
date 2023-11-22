function [signal, signal_padded] = frequency_analysis(signal, fs, resol, ...
    window, overlap_percent,x_lim_frequency, y_lim_au, x_axis_type, y_axis_type)

%% 1. Frequency resolution and then DFT => done via zero padding

n = fs/resol; % gives the length of signal to get the desired spectral resolution 
signal_padded = zero_padding(signal, n);


[X, frequencies] = make_spectrum(signal_padded, fs, x_lim_frequency, ...
    y_lim_au, x_axis_type, y_axis_type);

%% 2. STFT : from window type, overlap and frequency resolution => dedude other parameters

% window_length = dof
resol_stft = 100;
window_length = get_window_size(resol_stft, fs, window); 


% convert percentage to samples
overlap = round(window_length * overlap_percent / 100); 

% apply STFT from window size, window type, overlap 
s = stft(fs, signal_padded, overlap, window, window_length);




end