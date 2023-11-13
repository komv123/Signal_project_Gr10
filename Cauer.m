function[B,A]=Cauer(n,freq,fs,type)
   
    %This function designs an elliptic(Cauer) filter and returns the
    %coefficients

    Rp=2;  %Rp and RS chosen arbitrarely
    Rs=100;
    
    if type == 'lp' %Lowpass Cauer filter
        [B,A]=ellip(n,Rp,Rs,freq/(fs/2));
    end
    
    if type == 'bp' %Bandpass Cauer filter
        [B,A]=ellip(n,Rp,Rs,freq/(fs/2));
    end
    
    if type == 'hp' %Highpass Cauer filter
        [B,A]=ellip(n,Rp,Rs,freq/(fs/2),'high');
    end
    
    if type == 'bs' %Bandstop Cauer filter
        [B,A]=ellip(n,Rp,Rs,freq/(fs/2),'stop');
    end

end