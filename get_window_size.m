function N = get_window_size(resol, fs, window_type)
if (window_type == "rect")
    N = 2*fs/resol; 
end 
if (window_type == "hamming")
    N = 4*fs/resol; 
    
end
if (window_type == "hann")
    N = 6*fs/resol;
end

if (window_type == "blackmann")
    N = 6*fs/resol;
end 


end