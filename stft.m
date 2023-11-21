function S = stft(fs, signal, overlap, window, window_length)


% perform STFT
if (window == "rect")
   [S, F, T] = spectrogram(signal, rectwin(window_length), overlap, [], fs);
end 
if (window == "hamming")
    [S, F, T] = spectrogram(signal, hamming(window_length), overlap, [], fs);
end
if (window == "hann")
    [S, F, T] = spectrogram(signal, hann(window_length), overlap, [], fs);
end

if (window == "blackmann")
    [S, F, T] = spectrogram(signal, blackman(window_length), overlap, [], fs);
end 



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