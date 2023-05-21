function plotBandpassFilterResponse(b, a, f_low, f_high, fs, filter_type)
    % create GainPhaseResponse folder if it not existed
    folder1 = 'GainPhaseResponse';
    if ~exist(folder1, 'dir')
        mkdir(folder1);
    end
    
    % create FilterResponse folder if it doesn't exist
    folder2 = 'FilterResponse';
    if ~exist(folder2, 'dir')
        mkdir(folder2);
    end
    
    figure;
    freqz(b, a, [], fs);
    xlim([f_low-500 f_high+500]);
    title(['Gain and Phase response of the ' num2str(f_low) ' - ' num2str(f_high) ' kHz band ' filter_type ' filter']);
    
    % save the figure in the GainPhaseResponse folder
    saveas(gcf, fullfile(folder1, ['GainPhaseResponse_' num2str(f_low) '_' num2str(f_high) '.png']));

    figure;
    subplot(3, 1, 1);
    impz(b, a); 
    title(['Impulse response of the ' num2str(f_low) ' - ' num2str(f_high) ' kHz band filter']);
    
    subplot(3, 1, 2);
    stepz(b, a); 
    title(['Step response of the ' num2str(f_low) ' - ' num2str(f_high) ' kHz band filter']);
    
    subplot(3, 1, 3);
    zplane(b, a); 
    title(['Zeros and Poles of the ' num2str(f_low) ' - ' num2str(f_high) ' kHz band filter']);
    
    % Save the figure in the FilterResponse folder
    saveas(gcf, fullfile(folder2, ['FilterResponse_' num2str(f_low) '_' num2str(f_high) '.png']));
end
