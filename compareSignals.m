function compareSignals(original, composite, fs)
    % create CompareSignals folder if it's not existed/found
    folder = 'CompareSignals';
    if ~exist(folder, 'dir')
        mkdir(folder);
    end
    
    % time domain
    t = linspace(0, length(original)/fs, length(original));


    figure('Position', [0, 0, 1000, 700]);  % set the figure size

    % calculate the center position of the screen
    screen_size = get(groot, 'ScreenSize');
    center_x = (screen_size(3) - 1000) / 2;  % adjust fig width 
    center_y = (screen_size(4) - 700) / 2;   % adjust fig height
    
    % set the figure position to the center
    set(gcf, 'Position', [center_x, center_y, 1000, 700]);
     
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

    % frequency domain
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
    
    % save img in the CompareSignals folder
    saveas(gcf, fullfile(folder, 'CompareSignals.png'));
end
