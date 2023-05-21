function [b, a] = lowPassFilter(fs, fc1, filter_type)
    f_normalize = fs / 2;
    wn = fc1 / f_normalize;
    
    if (filter_type == 1)
        [b, a] = fir1(300, wn, 'low');
        [b, a] = eqtflength(b, a);
    elseif (filter_type == 2)
        [b, a] = butter(3, wn, 'low');
        [b, a] = eqtflength(b, a);
    else
        error('error input');
    end
end
