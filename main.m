clc

disp('Insert .wav file:');
[baseName, folder] = uigetfile('*.wav');
file = fullfile(folder, baseName);
[x, fs] = audioread(file);

choose = menu(strcat('Current FS = ',num2str(fs),'----','Want to change output sampling rate?'),'Yes','No');
if (choose == 1)
    fs_new = input('Enter the new output sampling rate:');
    x = resample(x, fs_new, fs);
    fs = fs_new;
end

disp('Insert the gain for each of the following bandwidths in dB:');
bands = {'FROM 0 TO 170 Hz', 'FROM 170 TO 310 Hz', 'FROM 310 TO 600 Hz', 'FROM 600 TO 1000 Hz', 'FROM 1 TO 3 KHz', 'FROM 3 TO 6 KHz', 'FROM 6 TO 12 KHz', 'FROM 12 TO 14 KHz', 'FROM 14 TO 16 KHz'};
gains = zeros(1, 9);

for i = 1:numel(bands)
    disp([bands{i}, ':']);
    gains(i) = input('');
end

freqRanges = {
    [0, 170]
    [170, 300]
    [300, 610]
    [610, 1005]
    [1005, 3000]
    [3000, 6000]
    [6000, 12000]
    [12000, 14000]
    [14000, 16000]
};

filterType = menu('Choose filter', 'IIR', 'FIR');

[b, a] = lowPassFilter(fs, 170, filterType);
filtered = filter(b, a, x);
after_gain = filtered * gains(1);

for i = 2:9
    freqRange = freqRanges{i};
    f_low = freqRange(1);
    f_high = freqRange(2);
    [b, a] = bandPassFilter(fs, f_low, f_high, filterType);
    filtered = filter(b, a, x);
    after_gain = after_gain + filtered * gains(i);
end

sound(after_gain, fs);

