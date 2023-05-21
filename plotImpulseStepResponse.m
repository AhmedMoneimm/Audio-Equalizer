function plotImpulseStepResponse(b, a, fs)
    impulse_response = impulse(tf(b, a, 1/fs));
    step_response = step(tf(b, a, 1/fs));

    figure;
    subplot(2, 1, 1);
    plot(impulse_response);
    title('Impulse Response');
    xlabel('Samples');
    ylabel('Amplitude');

    subplot(2, 1, 2);
    plot(step_response);
    title('Step Response');
    xlabel('Samples');
    ylabel('Amplitude');
end
