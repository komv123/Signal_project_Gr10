function [B,A]=IIRFiltergenerator(approx,order,type,freq,fs)

       %Generate a filter following the approximation asked in the specs

       if approx(1,1:5) == 'cauer'
           [B,A]=Cauer(order,freq,fs,type);
           return
       end

       if approx(1,1:10) == 'chebyshevI'
           [B,A]=ChebyshevI(order,freq,fs,type);
           return
       end

       if approx == 'butterworth'
           [B,A]=Butterworth(order,freq,fs,type);
           return
       end

       if approx == 'chebyshevII'
           [B,A]=ChebyshevII(order,freq,fs,type);
           return
       end

end