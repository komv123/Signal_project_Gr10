function signal = zero_pad(f, t_tot, sign)
if nargin == 2
    signal = zeros(1, f*t_tot);
elseif nargin == 3
    signal = [sign, zeros(1, (f*t_tot)-length(sign))];
end
