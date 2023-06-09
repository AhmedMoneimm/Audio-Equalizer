function plotFilteredSignal(input_wave, filtered, band_gain, f_low, f_high)
    % create FilteredSignal folder if it doesn't exist
    folder = 'FilteredSignal';
    if ~exist(folder, 'dir')
        mkdir(folder);
    end
    
    figure('Position', [0, 0, 1200, 700]);  % set the figure size

    % calculate the center position of the screen
    screen_size = get(groot, 'ScreenSize');
    center_x = (screen_size(3) - 1200) / 2;  % adjust fig width 
    center_y = (screen_size(4) - 700) / 2;   % adjust fig height
    
    % set the figure position to the center
    set(gcf, 'Position', [center_x, center_y, 1200, 700]);

    subplot(3, 2, 1)
    plot(real(input_wave));
    title('Original Signal Time Domain');
    xlim([0, length(input_wave)]);  % set x-axis limits
    
    subplot(3, 2, 2)
    plot(real(fft(input_wave)));
    title('Original Signal in Frequency Domain');
    xlim([0, length(fft(input_wave))]);  % set x-axis limits
    
    subplot(3, 2, 3)
    plot(real(filtered));
    title(['BandPass Signal Time Domain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    xlim([0, length(filtered)]);  % set x-axis limits
    
    subplot(3, 2, 4)
    plot(real(fft(filtered)));
    title(['BandPass Filtered Signal in Frequency Domain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    xlim([0, length(fft(filtered))]);  % set x-axis limits
    
    subplot(3, 2, 5)
    plot(real(band_gain));
    title(['BandPass Filtered Signal Time Domain with gain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    xlim([0, length(band_gain)]);  % set x-axis limits
    
    subplot(3, 2, 6)
    plot(real(fft(band_gain)));
    title(['BandPass Filtered Signal in Frequency Domain with gain [' num2str(f_low) ' - ' num2str(f_high) ' Hz]']);
    xlim([0, length(fft(band_gain))]);  % set x-axis limits
    
    % save the figures in the FilteredSignal folder
    saveas(gcf, fullfile(folder, ['FilteredSignal_' num2str(f_low) '_' num2str(f_high) '.png']));
end
