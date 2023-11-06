function[B,A]=ChebyshevII(n,freq,fs,type)
    
    %This function designs a ChebyshevII filter and returns the
    %coefficients

    fc1=freq(1,1);
    fc2=freq(1,2);
  
    Rp=1; %Rp chosen arbitrarely
    
    if type == 'lp' %Lowpass chebyshevII filter
        [B,A]=cheby2(n,Rp,fc1/(fs/2));
    end
    
    if type == 'bp' %Bandpass chebyshevII filter
        [B,A]=cheby2(n,Rp,[fc1/(fs/2) fc2/(fs/2)])
    end
    
    if type == 'hp' %Highpass chebyshevII filter
        [B,A]=cheby2(n,Rp,fc1/(fs/2),'high')
    end
    
    if type == 'bs' %Bandstop chebyshevII filter
        [B,A]=cheby2(n,Rp,[fc1/(fs/2) fc2/(fs/2)],'stop')
    end
end