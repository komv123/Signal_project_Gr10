function[B,A]=ChebyshevII(n,freq,fs,type)
    
    %This function designs a ChebyshevII filter and returns the
    %coefficients

  
    Rp=1; %Rp chosen arbitrarely
    
    if type == 'lp' %Lowpass chebyshevII filter
        [B,A]=cheby2(n,Rp,freq/(fs/2));
    end
    
    if type == 'bp' %Bandpass chebyshevII filter
        [B,A]=cheby2(n,Rp,freq/(fs/2))
    end
    
    if type == 'hp' %Highpass chebyshevII filter
        [B,A]=cheby2(n,Rp,freq/(fs/2),'high')
    end
    
    if type == 'bs' %Bandstop chebyshevII filter
        [B,A]=cheby2(n,Rp,freq/(fs/2),'stop')
    end
end