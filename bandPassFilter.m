function [a,b] = bandPassFilter(fs,fc1,fc2,filter_type)
    f_normalize = fs / 2;
    wn = [fc1 fc2] / f_normalize;
    if (filter_type == 1)
        [a, b] = fir1(300, wn, 'bandpass');
        [a, b] = eqtflength(a, b);
    elseif (filter_type == 2)
        [a, b] = butter(3, wn, 'bandpass');
        [a, b] = eqtflength(a, b);
    else
        disp("error input");
    end
end

