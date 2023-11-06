function[B,A]=ChebyshevI(n,freq,fs,type)
    
    %This function designs chebyshevI filters and returns the coefficients

    fc1=freq(1,1);
    fc2=freq(1,2);
    Rp=1;   %Rp is chose arbitrarely (suitable value)
    
    if type == 'lp'  %Lowpass chebyshevI filter
        [B,A]=cheby1(n,Rp,fc1/(fs/2));
    end
    
    if type == 'bp'  %Bandpass chevyshevI filter
        [B,A]=cheby1(n,Rp,[fc1/(fs/2) fc2/(fs/2)])
    end
    
    if type == 'hp'  %Highpass chebyshevI filter
        [B,A]=cheby1(n,Rp,fc1/(fs/2),'high')
    end
    
    if type == 'bs'  %Bandstop chebyshevI filter
        [B,A]=cheby1(n,Rp,[fc1/(fs/2) fc2/(fs/2)],'stop')
    end
end