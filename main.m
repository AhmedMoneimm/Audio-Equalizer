clc
% Enter the audio file
disp('Insert .wav file:');
[baseName, folder] = uigetfile('*.wav');
file = fullfile(folder, baseName);
[x, fs] = audioread(file);
fs = 2*fs + 1;

choose = menu(strcat('Current FS = ',num2str(fs),'----','Want to change output sampling rate?'),'Yes','No','Double','half');
fs_new = fs;
if (choose == 1)
    fs_new = input('Enter the new output sampling rate:');
    x = resample(x, fs_new, fs);
elseif(choose == 3)
    fs_new = 2*fs;
    x = resample(x, fs_new, fs);
elseif(choose == 4)
    fs_new = fs/2;
    x = resample(x, fs_new, fs);
end

disp(fs_new);

disp('Insert the gain for each of the following bandwidths in dB:');
bands = {'FROM 0 TO 170 Hz', 'FROM 170 TO 300 Hz', 'FROM 300 TO 610 Hz', 'FROM 610 TO 1005 Hz', 'FROM 1.005 TO 3 KHz', 'FROM 3 TO 6 KHz', 'FROM 6 TO 12 KHz', 'FROM 12 TO 14 KHz', 'FROM 14 TO 20 KHz'};
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
    [14000, 20000]
};

filterType = menu('Choose filter', 'FIR', 'IIR');

for i = 1:9
    freqRange = freqRanges{i};
    f_low = freqRange(1);
    f_high = freqRange(2);
    
    if i == 1
        [b, a] = lowPassFilter(fs, 170, filterType);
        filtered = filter(b, a, x);
        after_gain = power(10, gains(1)/20) * filtered;
    else
        [b, a] = bandPassFilter(fs, f_low, f_high, filterType);
    end

    band_gain = power(10, gains(i)/20) * filtered;
    
    plotBandpassFilterResponse(b, a, f_low, f_high, fs,filterType);
    plotFilteredSignal(x, filtered, band_gain, f_low, f_high);

    after_gain = after_gain + band_gain;
end


compareSignals(x, after_gain, fs);

sound(after_gain, fs);
