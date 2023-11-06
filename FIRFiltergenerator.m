function[b]=FIRFiltergenerator(order,type,freq,fs)

    fc1=freq(1,1);
    fc2=freq(1,2);

    if type == 'lp'
        b = fir1(order,fc1/(fs/2));
    end

    if type == 'bp'
        b = fir1(order,[fc1/(fs/2) fc2/(fs/2)]);
    end

    if type == 'hp'
        b = fir1(order, fc1/(fs/2),'high');
    end

    if type == 'bs'
        b = fir1(order,[fc1/(fs/2) fc2/(fs/2)],'stop');
    end

end