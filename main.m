filename = 'audio.wav';
[input_wave, fs] = audioread(filename);

filtered_wave = FIR_wave_filter(fs, 171, 310, input_wave);

% add here the condition 