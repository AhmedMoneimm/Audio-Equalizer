function filtered_wave = FIR_wave_filter(fs, f1, f2, input_wave, gain)
    filter_order = 100;
    a = 1;
    filter_cutoff = [f_low, f_high]/(fs/2);
    b = fir1(filter_order, filter_cutoff, 'bandpass');
    filtered_wave = applyBandPassFilter(fs, input_wave, b, a, gain, f1, f2);
end