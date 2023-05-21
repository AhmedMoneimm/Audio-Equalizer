function compareSignals(original, composite, fs)
    % Time Domain
    t = linspace(0, length(original)/fs, length(original));
    figure;
    subplot(2, 2, 1);
    plot(t, original);
    title('Original Signal');
    xlabel('Time (s)'); ylabel('Amplitude');
    grid on;
    
    subplot(2, 2, 2);
    plot(t, composite);
    title('Composite Signal');
    xlabel('Time (s)'); ylabel('Amplitude');
    grid on;

    % Frequency Domain
    L = length(original);
    f_xaxis = linspace(-fs/2, fs/2, L);

    subplot(2, 2, 3);
    fmag_original = abs(fftshift(fft(original))/fs);
    plot(f_xaxis, fmag_original);
    title('Original Signal in Frequency Domain');
    xlabel('Frequency (Hz)'); ylabel('Magnitude');
    grid on;

    subplot(2, 2, 4);
    fmag_composite = abs(fftshift(fft(composite))/fs);
    plot(f_xaxis, fmag_composite);
    title('Composite Signal in Frequency Domain');
    xlabel('Frequency (Hz)'); ylabel('Magnitude');
    grid on;
end
