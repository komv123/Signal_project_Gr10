function [x_padded] = zero_padding(x, n)
length_x = length(x); 
if n > length_x
    x_padded = [x zeros(1, n -length_x)];
else 
    x_padded = x; 
    
end
end 