function signal = generate_square(fs, per, t_tot)
    ii = 1;
    period = [ones(1, floor(fs*per)), zeros(1, floor(fs*(1-per)))];
    signal = zeros(1, floor(fs*t_tot));
    for i = 1:fs*t_tot
        if ii > length(period)
            ii = ii - length(period);
        end
        signal(i) = period(ii);
        ii = ii + 1;
    end
    signal
end


    