function [b, a] = bandPassFilter(fs, fc1, fc2, filter_type)
    f_normalize = fs / 2;
    wn = [fc1 fc2] / f_normalize;
    
    if (filter_type == 1)
        [b, a] = fir1(300, wn, 'bandpass');
        [b, a] = eqtflength(b, a);
    elseif (filter_type == 2)
        [b, a] = butter(3, wn, 'bandpass');
        [b, a] = eqtflength(b, a);
    else
        error('error input');
    end
end
