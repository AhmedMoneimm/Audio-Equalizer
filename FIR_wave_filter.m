function filtered_wave = FIR_wave_filter(fs, f_low, f_high, input_wave)
    filter_order = 100;
    a = 1;
    filter_cutoff = [f_low, f_high]/(fs/2);
    b = fir1(filter_order, filter_cutoff, 'bandpass');
    fvtool(b, a, 'Fs', fs);
    filtered_wave = filter(b, a, input_wave);
end