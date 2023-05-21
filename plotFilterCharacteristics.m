function plotFilterCharacteristics(b, a, freqRange, bandgain, fs, y)
    f_low = freqRange(1);
    f_high = freqRange(2);
    
    title1 = ['Gain and Phase response of ', num2str(f_low), ' Hz - ' , num2str(f_high), ' Hz filter'];
    title2 = ['Impulse response of ', num2str(f_low), ' Hz - ' , num2str(f_high), ' Hz filter'];
    title3 = ['Step response of ', num2str(f_low), ' Hz - ' , num2str(f_high), ' Hz filter'];
    title4 = ['Zeros and Poles of ', num2str(f_low), ' Hz - ' , num2str(f_high), ' Hz filter'];
    title5 = ['Time Domain signal with (', num2str(f_low), ' Hz - ' , num2str(f_high), ' Hz) filter'];
    title6 = 'Magnitude of filtered signal in frequency domain';
    title7 = 'Phase of filtered signal in frequency domain';

    figure;
    freqz(b, a); 
    title(title1);

    figure;
    subplot(2,2,1);
    impz(b,a); 
    title(title2);
    subplot(2,2,2);
    stepz(b,a); 
    title(title3);

    [z,p,k] = tf2zpk(b,a);
    subplot(2,2,[3,4]);
    zplane(z,p); 
    title(title4);

    filteredSignal = bandgain * filter(b, a, y); 
    figure;
    subplot(3,1,1)
    plot(t, filteredSignal);
    title(title5);            
    xlabel('Time in seconds');
    ylabel('Amplitude');

    subplot(3,1,2);
    fmag = abs(fftshift(fft(filteredSignal))/fs);           
    f_xaxis = linspace(-fs/2, fs/2, numel(filteredSignal));
    plot(f_xaxis, fmag); % filtered signal in frequency domain
    title(title6);
    xlabel('Frequency (Hz)'); 
    ylabel('Magnitude');

    phase = angle(fftshift(fft(filteredSignal)));
    subplot(3,1,3)
    plot(f_xaxis, phase);
    title(title7); 
    xlabel('Frequency (Hz)'); 
    ylabel('Phase');
    
    % fvtool(b, a);
end
