function plotGainPhaseResponse(signal, fs)
    freq = linspace(0, fs/2, numel(signal)/2);
    gain_response = 20*log10(abs(fft(signal)));
    phase_response = angle(fft(signal));

    figure;
    subplot(2, 1, 1);
    plot(freq, gain_response(1:numel(freq)));
    title('Gain Response');
    xlabel('Frequency (Hz)');
    ylabel('Gain (dB)');

    subplot(2, 1, 2);
    plot(freq, phase_response(1:numel(freq)));
    title('Phase Response');
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
end
