function[B,A]=Butterworth(n,freq,fs,type)

    %This function designs IIR butterworth filters and returns the
    %coefficients.

    fc1=freq(1,1);
    fc2=freq(1,2);
    
    if type == 'bp'    %Bandpass butterworth filter
        [B,A]=butter(n,[fc1/(fs/2) fc2/(fs/2)]);
    end
    
    if type == 'lp'    %Lowpass butterworth filter
        [B,A]=butter(n,fc1/(fs/2));
    end
    
    if type == 'hp'    %Highpass butterworth filter
        [B,A]=butter(n,fc1/(fs/2),'high');
    end
    
    if type == 'bs'    %Bandstop butterworth filter
        [B,A]=butter(n,[fc1/(fs/2) fc2/(fs/2)],'stop');
    end
end