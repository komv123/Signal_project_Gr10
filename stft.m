function [S, F, T] = stft(signal, window_length, overlap_percent, fs)
% gives overlaping in terms of samples, not of %
overlap = round(window_length * overlap_percent / 100); 

% perform STFT
[S, F, T] = spectrogram(signal, window_length, overlap, [], fs);


% plot it 
figure('Name', 'STFT of signal');
imagesc(T, F, 10*log10(abs(S)));
axis xy;
title('STFT');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar;

colormap('jet');


end