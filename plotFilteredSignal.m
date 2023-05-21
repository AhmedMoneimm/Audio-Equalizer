function plotFilteredSignal(input_wave, filtered, band_gain, f_low, f_high)
    
    f = figure('Position', [150, -105, 2500, 2500]);
    subplot(3, 2, 1)
    plot(real(input_wave));
    title('Original Signal Time Domain');
    
    subplot(3, 2, 2)
    plot(real(fft(input_wave)));
    title('Original Signal in Frequency Domain');
    
    subplot(3, 2, 3)
    plot(real(filtered));
    title(['BandPass Signal Time Domain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    
    subplot(3, 2, 4)
    plot(real(fft(filtered)));
    title(['BandPass Filtered Signal in Frequency Domain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    
    subplot(3, 2, 5)
    plot(real(band_gain));
    title(['BandPass Filtered Signal Time Domain with gain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    
    subplot(3, 2, 6)
    plot(real(fft(band_gain)));
    title(['BandPass Filtered Signal in Frequency Domain with gain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    
end
