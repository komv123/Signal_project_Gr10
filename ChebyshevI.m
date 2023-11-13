function[B,A]=ChebyshevI(n,freq,fs,type)
    
    %This function designs chebyshevI filters and returns the coefficients
  

    Rp=1;   %Rp is chose arbitrarely (suitable value)
    
    if type == 'lp'  %Lowpass chebyshevI filter
        [B,A]=cheby1(n,Rp,freq/(fs/2));
    end
    
    if type == 'bp'  %Bandpass chevyshevI filter
        [B,A]=cheby1(n,Rp,freq/(fs/2));
    end
    
    if type == 'hp'  %Highpass chebyshevI filter
        [B,A]=cheby1(n,Rp,freq/(fs/2),'high');
    end
    
    if type == 'bs'  %Bandstop chebyshevI filter
        [B,A]=cheby1(n,Rp,freq/(fs/2),'stop');
    end
end