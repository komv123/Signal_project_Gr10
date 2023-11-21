function [X, freq] = make_spectrum(n, fs)
T0 = length(n)/fs; 
delta_f = 1/T0;   % spectrum resolution directly depends on duration
disp(delta_f)

% frequency axis with respect to spectrum resolution 
freq = 0:delta_f:fs-delta_f;


X = fft(n);


figure('Name', 'Spectrum of signal'); 
%1. Magnitude spectrum 
stem(freq, abs(X));
xlabel('frequecy / Hz');
ylabel('magnitude'); 
xlim([0 fs/2]);
title('Magnitude Spectrum (Fourier Transform)');

% % 1.2 Magnitude on logarithmic scale in dB
% subplot(2,2,2)
% semilogx(freq, 20*log10(abs(X)));
% xlabel('frequecy / Hz');
% ylabel('magnitude / dB'); 
% xlim([0 fs/2]);
% title('Magnitude Spectrum (Fourier Transform)');
% % 
% % % 2. Phase spectrum
% % subplot(2,2,2)
% % stem(freq, angle(X)); %% is that what we want to get ??
% % xlabel('frequecy / Hz');
% % ylabel('phase'); 
% % xlim([0 fs/2]);
% % title('Phase Spectrum (Fourier Transform)');
% % 
% % % 3. Real part spectrum 
% % subplot(2,2,3)
% % stem(freq, real(X)); 
% % xlabel('frequecy / Hz');
% % ylabel('real part'); 
% % xlim([0 fs/2]);
% % title('Real part Spectrum (Fourier Transform)');
% % 
% % % 4. Imaginary part spectrum 
% % subplot(2,2,4)
% % stem(freq, imag(X)); 
% % xlabel('frequecy / Hz');
% % ylabel('imaginary part'); 
% % xlim([0 fs/2]);
% % title('Imaginary part Spectrum (Fourier Transform)');
% 
% 
% 
% 
% 
% 
% 
% end