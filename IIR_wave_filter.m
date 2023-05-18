function filtered_wave = IIR_wave_filter(fs, f_low, f_high, input_wave, gain)
    filter_order = 2;
    filter_cutoff = [f_low, f_high]/(fs/2);
    [b, a] = butter(filter_order, filter_cutoff, 'bandpass');
    filtered_wave = applyBandPassFilter(fs, input_wave, b, a, gain, f1, f2);
end
