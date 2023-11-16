function[filtered_signal]=Filtering(signal,specs)


    freq = specs.cut_off_frequency;
    fs = specs.fs;
    order = specs.filter_order;
    type = specs.filter_type;
    approx = specs.approximation_method;

    
    [B,A]=IIRFiltergenerator(approx,order,type,freq,fs);
    y=filter(B,A,signal);


    

    %If we want an FIR, we have to do this :

    IR = specs.filtering;
    
    
    if(IR=='fir')
        [h,t]=impz(B,A);
        freqz(h,1,[],fs);
        filtered_signal = filter(h,1,signal);

    end
    
    if(IR=='iir')
        freqz(B,A,[],fs)
        filtered_signal = y;
    end
  

end



