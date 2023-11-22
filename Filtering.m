function[filtered_signal]=Filtering(signal,specs)


    freq = specs.cut_off_frequency;
    fs = specs.fs;
    order = specs.filter_order;
    type = specs.filter_type;
    approx = specs.approximation_method;

    
    %Generate the IIR filter 

    [B,A]=IIRFiltergenerator(approx,order,type,freq,fs);
    figure('name','Pole/zero diagram')
    zplane(B,A);
    saveas(gcf,'Pole zero diagram.pdf');
    y=filter(B,A,signal);


    IR = specs.filtering;
    
    
    %Generate and plot the fir filter and filter the signal

    if(IR=='fir')
        [h,t]=impz(B,A);
        figure('name','Filter transfer function and phase')
        freqz(h,1,[],fs);
        saveas(gcf,'Filter magnitude and phase.pdf');
        filtered_signal = filter(h,1,signal);

    end
    
    % or filter with iir filter

    if(IR=='iir')
        figure('name','Filter transfer function and phase')
        freqz(B,A,[],fs)
        saveas(gcf,'Filter magnitude and phase.pdf');
        filtered_signal = y;
    end
  
end



