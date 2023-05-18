function filtered_wave = IIR_wave_filter(fs, f_low, f_high, input_wave)
    filter_order = 2;
    filter_cutoff = [f_low, f_high]/(fs/2);
    [b, a] = butter(filter_order, filter_cutoff, 'bandpass');
    fvtool(b, a, 'Fs', fs);
    filtered_wave = filter(b, a, input_wave);
end
