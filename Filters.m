function main()
    % Main function to execute filter design, signal creation, and plotting
    fs = 16000; % Sampling frequency
    N = 1024;   % Number of points for the frequency response
    duration = 2; % Duration of the signal in seconds

    % Design IIR filter
    [b_iir, a_iir, w, h] = designIIRFilter(fs, N, 30, 7300);

    % Design FIR filter
    [h_fir, W_fir, H_fir] = designFIRFilter(fs, N, 1, 7250, 128, 8);

    %% Notes about filter design:
    % The choice of low_cutoff_K = 0 is related to the FIR filter's passband. 
    % Setting values in the range (0, 50) causes a longer rise time, reaching zero at 50 Hz. 
    % In practice, the value reaches around 150 Hz. low_cutoff_B = 30 is the closest value 
    % to 50 Hz that meets the assumptions (faster rise time than the IIR filter).

    % The choice of beta = 8 (Kaiser window parameter) ensures a compromise between a 
    % sufficiently steep slope in the passband and sidelobe attenuation.

        % Create a test signal
    [t, signal] = createSignal(fs, duration);

    % Apply filters to the signal
    filtered_signal_iir = filter(b_iir, a_iir, signal); % IIR filtered signal
    filtered_signal_fir = filter(h_fir, 1, signal); % FIR filtered signal

    % Plot GWM (Power Spectral Density)
    plotPSD(signal, filtered_signal_iir, filtered_signal_fir, fs);
end

function [t, signal] = createSignal(fs, duration)
    % Create a test signal with aliasing and white noise
    t = 0:1/fs:duration-1/fs; % Time vector
    
    % Signal with frequencies below and above Nyquist frequency
    signal_clean = sin(2*pi*100*t) + 0.5*sin(2*pi*6000*t) + 0.2*sin(2*pi*12000*t);
    
    % Add white noise to the signal
    noise = 0.1 * randn(size(t));
    
    % Combine clean signal with noise
    signal = signal_clean + noise;
end

function [b, a, w, h] = designIIRFilter(fs, N, low_cutoff, high_cutoff)
    % Design IIR Butterworth filter and calculate its frequency response
    [b, a] = butter(4, [low_cutoff, high_cutoff] / (fs / 2));
    [h, w] = freqz(b, a, N, fs); % Frequency response of the IIR filter
end

function [h_fir, W_fir, H_fir] = designFIRFilter(fs, N, low_cutoff, high_cutoff, order, beta)
    % Design FIR filter using a Kaiser window and calculate its frequency response
    h_fir = fir1(order, [low_cutoff, high_cutoff] / (fs / 2), kaiser(order + 1, beta));
    [H_fir, W_fir] = freqz(h_fir, 1, N, fs); % Frequency response of the FIR filter
end

function plotPSD(original, filtered_iir, filtered_fir, fs)
    % Plot Power Spectral Density (PSD) of original and filtered signals
    figure;

    % Calculate and plot PSD of the original signal
    subplot(3, 1, 1);
    [Pxx, F] = pwelch(original, [], [], [], fs);
    plot(F, 10*log10(Pxx), 'k', 'LineWidth', 1.5);
    title('Power Spectral Density - Original Signal');
    xlabel('Frequency (Hz)');
    ylabel('Power (dB/Hz)');
    grid on;

    % Calculate and plot PSD of the IIR-filtered signal
    subplot(3, 1, 2);
    [Pxx_iir, F_iir] = pwelch(filtered_iir, [], [], [], fs);
    plot(F_iir, 10*log10(Pxx_iir), 'b', 'LineWidth', 1.5);
    title('Power Spectral Density - IIR Filtered Signal');
    xlabel('Frequency (Hz)');
    ylabel('Power (dB/Hz)');
    grid on;

    % Calculate and plot PSD of the FIR-filtered signal
    subplot(3, 1, 3);
    [Pxx_fir, F_fir] = pwelch(filtered_fir, [], [], [], fs);
    plot(F_fir, 10*log10(Pxx_fir), 'r', 'LineWidth', 1.5);
    title('Power Spectral Density - FIR Filtered Signal');
    xlabel('Frequency (Hz)');
    ylabel('Power (dB/Hz)');
    grid on;
end
