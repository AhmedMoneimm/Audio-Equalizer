function [a,b] = lowPassFilter(fs,fc1,filter_type)
f_normalize = fs / 2;
    
    wn = fc1 / f_normalize;
    if (filter_type == 1)
        [a, b] = fir1(300, wn, 'low');
        [a, b] = eqtflength(a, b);
    elseif (filter_type == 2)
        [a, b] = butter(3, wn, 'low');
        [a, b] = eqtflength(a, b);
    else
        disp("error input");
    end
end
