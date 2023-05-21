function analyzeBandpassFilter(samplerate, freq1, freq2, order, filter_type, num_sample, audiodata, t, f)
    for i = 1:length(freq1)
        [a, b] = bandpass(samplerate, freq1(i), freq2(i), order, filter_type);
        TF = tf(a, b);

        % Filter analysis
        figure;
        subplot(2, 1, 1);
        freqz(a, b, num_sample);
        range = strcat(' (', int2str(freq1(i)), 'Hz - ', int2str(freq2(i)), 'Hz)');
        title(strcat('Magnitude & Phase of H', int2str(i), '(Z)', range));

        subplot(2, 1, 2);
        pzmap(TF);
        title(strcat('Poles and Zeros', int2str(i), '(Z)', range));

        % Impulse and Step response
        figure;
        subplot(2, 1, 1);
        impulse(TF);
        title(strcat('Impulse Response', int2str(i), '(Z)', range));

        subplot(2, 1, 2);
        step(TF);
        title(strcat('Step Response', int2str(i), '(Z)', range));

        % Output analysis
        y = filter(a, b, audidata);
        Y = fftshift(fft(y));

        figure;
        subplot(3, 1, 1);
        plot(t, y);
        title(strcat('Time Domain of the Output Signal', int2str(i), '(Z)', range));

        subplot(3, 1, 2);
        plot(f, 20 * log10(abs(Y)));
        title(strcat('Magnitude of the Output Signal', int2str(i), '(Z)', range));

        subplot(3, 1, 3);
        plot(f, angle(Y));
        title(strcat('Phase of the Output Signal', int2str(i), '(Z)', range));
    end
end
