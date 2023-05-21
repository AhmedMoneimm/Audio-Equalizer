function plotGainPhaseResponse(signal, fs, f_low, f_high)
    % frequency domain
    L = length(signal);
    f_xaxis = linspace(-fs/2, fs/2, L);
    fmag = abs(fftshift(fft(signal))/fs);
    phase = angle(fftshift(fft(signal)));

    % create folder if it doesn't exist
    folder = 'GainPhaseResponse';
    if ~exist(folder, 'dir')
        mkdir(folder);
    end

    figure;
    subplot(2, 1, 1);
    plot(f_xaxis, fmag);
    title(['Gain Response: ' num2str(f_low) ' - ' num2str(f_high) ' Hz']);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');

    subplot(2, 1, 2);
    plot(f_xaxis, phase);
    title(['Phase Response: ' num2str(f_low) ' - ' num2str(f_high) ' Hz']);
    xlabel('Frequency (Hz)');
    ylabel('Phase (radians)');

    % saves the imgs
    saveas(gcf, fullfile(folder, ['GainPhaseResponse_' num2str(f_low) '_' num2str(f_high) '.png']));
end
