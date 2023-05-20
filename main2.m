clc

filename = input('Enter the wave file name: ', 's'); % audio.wav

frequencyGains = zeros(1, size(frequencyBands, 1));

for i = 1:size(frequencyBands, 1)
    frequencyGains(i) = input(sprintf('Enter the gain for frequency band %d: ', i));
end

filterType = menu('Choose filter ','IIR','FIR');
outputSampleRate = input('Enter the output sample rate: ');

frequencyBands = [0 170; 170 310; 310 600; 600 1000; 1000 3000; 3000 6000; 6000 12000; 12000 14000; 14000 16000];


[inputWave, sampleRate] = audioread(filename);

% init o/p signal
outputSignal = zeros(size(inputWave));

% apply filters
for i = 1:size(frequencyBands, 1)
    f_low = frequencyBands(i, 1);
    f_high = frequencyBands(i, 2);
    gain = frequencyGains(i);
    
    if strcmp(filterType, 'FIR')
        filteredWave = FIR_wave_filter(sampleRate, f_low, f_high, inputWave, gain);
    elseif strcmp(filterType, 'IIR')
        filteredWave = IIR_wave_filter(sampleRate, f_low, f_high, inputWave, gain);
    else
        error('Invalid filter type. Please choose between FIR or IIR.');
    end
    
    outputSignal = outputSignal + filteredWave;
end


% make Composite Signal
compositeSignal = sum(outputSignal, 2);

% compare Composite Signal with Original Signal
figure;
subplot(2, 1, 1);
plot(time, inputWave);
hold on;
plot(time, compositeSignal);
legend('Original Signal', 'Composite Signal');
title('Comparison of Original Signal and Composite Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(frequency, abs(fftshift(fft(inputWave))));
hold on;
plot(frequency, abs(fftshift(fft(compositeSignal))));
legend('Original Signal', 'Composite Signal');
title('Comparison of Original Signal and Composite Signal - Frequency Domain');
xlabel('Frequency');
ylabel('Magnitude');

sound(outputSignal, outputSampleRate);
