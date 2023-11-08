function signal = generate_tone_complex(fs, freq, t_tot)
    signal = zeros(1, floor(fs*t_tot));
    for i = 1:length(freq)
        tone = generate_tone(fs, freq(i), t_tot);
        for ii = 1:fs*t_tot
            signal(ii) = signal(ii) + tone(ii);
        end
    end
end

