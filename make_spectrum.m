function [X, freq] = make_spectrum(n, fs, x_lim_frequency, ...
    y_lim_au, x_axis_type, y_axis_type)


if x_lim_frequency=='nyquist'
    Fmax=fs/2;
else
    Fmax=str2num(x_lim_frequency);
end

T0 = length(n)/fs; 
delta_f = 1/T0;   % spectrum resolution directly depends on duration


% frequency axis with respect to spectrum resolution 
freq = 0:delta_f:fs-delta_f;


X = fft(n);


figure('Name', 'Spectrum of signal'); 
%1. Magnitude spectrum plot
if x_axis_type=='lin'
    if y_axis_type=='lin'
        stem(freq, abs(X));
    end
    if y_axis_type=='log'
        stem(freq,abs(X))
        set(gca,'yscale','log')
    end
end
if x_axis_type == 'log'
    if y_axis_type=='lin'
        stem(freq, abs(X));
        set(gca,'xscale','log')
    end
    if y_axis_type=='log'
        stem(freq,abs(X))
        set(gca,'yscale','log')
        set(gca,'xscale','log')
    end
end
       
ylabel('magnitude'); 
xlim([0 Fmax]);
ylim([0 y_lim_au]);
title('Magnitude Spectrum (Fourier Transform)');
saveas(gcf,['Input signal spectrum.pdf']);

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