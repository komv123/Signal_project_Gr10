function[filtered_signal]=Filtering(signal,specs)


    freq = specs.cut_off_frequency;
    fs = specs.fs;
    order = specs.filter_order;
    type = specs.filter_type;
    approx = specs.approximation_method;

    % freq=[1000 3000];
    % fs=20000;
    % order=48;
    % type='hp';
    % approx = 'butterworth';
    
    [B,A]=IIRFiltergenerator(approx,order,type,freq,fs);
    [h,t]=impz(B,A,100);
    

    %If we want an FIR, we have to do this :

    IR = specs.filtering;
    
    
    if(IR=='fir')
        rect_window=[ones(40,1);zeros(length(h)-40,1)];
        filterIR = h.*rect_window;
        filtered_signal = conv(filterIR,signal);

    end
    
    if(IR=='iir')
        filtered_signal = conv(h,signal);
    end
  

end



