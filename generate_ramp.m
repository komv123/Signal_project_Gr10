function signal = generate_ramp(f, t_0, t_tot)
    if nargin == 2
        signal = zeros(1, f*t_0);
    elseif nargin == 3
        signal = zeros(1, f*t_tot);
    end
    for i = 1:f*t_0
        signal(i) = i;
    end
end

