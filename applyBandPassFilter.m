function filtered_wave = applyBandPassFilter(Fs, input_wave, b, a, gain, f1, f2)
    filteredSignal = filter(b, a, input_wave);
    filteredSignalG = power(10, gain/20) * filteredSignal;
    input_wave = filteredSignalG;
    f = figure('Position', [150, -105, 2500, 2500]);
    subplot(3, 2, 1)
    plot(real(input_wave));
    title('Original Signal Time Domain');
    subplot(3, 2, 2)
    plot(real(fft(input_wave)));
    title('Original Signal in Frequency Domain');
    subplot(3, 2, 3)
    plot(real(filteredSignal));
    title(['BandPass Signal Time Domain [' num2str(f1) ' - ' num2str(f2) ' Hz]']);
    subplot(3, 2, 4)
    plot(real(fft(filteredSignal)));
    title(['BandPass Filtered signal in Frequency Domain [' num2str(f1) ' - ' num2str(f2) ' Hz]']);
    subplot(3, 2, 5)
    plot(real(filteredSignalG));
    title(['BandPass Filtered Signal Time Domain with gain [' num2str(f1) ' - ' num2str(f2) ' Hz]']);
    subplot(3, 2, 6)
    plot(real(fft(filteredSignalG)));
    title(['BandPass Filtered Signal in Frequency Domain with gain [' num2str(f1) ' - ' num2str(f2) ' Hz]']);
end