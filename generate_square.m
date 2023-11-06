function signal = generate_square(f, t_0, t_tot)
    if nargin == 2
        signal = ones(1, floor(f*t_0));
    elseif nargin == 3
        signal = [ones(1, floor(f*t_0)), zeros(1, floor(f*(t_tot-t_0)))];
    end
end


    