function [a,b] = bandPassFilter(fs,fc1,fc2,order,filter_type)
    f_normalize = fs / 2;
    
    wn = [fc1 fc2] / f_normalize;
    if (filter_type == 0)
        [a, b] = fir1(order, wn, 'bandpass');
%         [a, b] = eqtflength(a, b);
    else
        [a, b] = butter(order, wn, 'bandpass');
%         [a, b] = eqtflength(a, b);
    end
end

