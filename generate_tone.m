function signal = generate_tone(fs, freq, t_tot)
    t = (1/fs:1/fs:t_tot);
    signal = sin(2*pi*freq*t);
end

