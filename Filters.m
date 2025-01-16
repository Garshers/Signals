fs = 16000; % Sampling frequency - consistent with the standard
N = 1024; % Number of points for the frequency response

% Design of the IIR filter (Butterworth)
low_cutoff_B = 30; % Lower cutoff frequency
high_cutoff_B = 7300; % Upper cutoff frequency

[b, a] = butter(4, [low_cutoff_B, high_cutoff_B] / (fs / 2));
[h, w] = freqz(b, a, N, fs); % Calculating the amplitude response

% Design of the FIR filter (Kaiser window)
low_cutoff_K = 1; % Lower cutoff frequency
high_cutoff_K = 7250; % Upper cutoff frequency
order = 128; % FIR filter order, chosen as a compromise between selectivity and filter length
beta = 8; % Kaiser window parameter, providing good sidelobe suppression and sharp band edges

h_fir = fir1(order, [low_cutoff_K, high_cutoff_K] / (fs / 2), kaiser(order + 1, beta));
[H_fir, W_fir] = freqz(h_fir, 1, N, fs); % Calculating the amplitude response

% Plotting IIR and FIR
figure;
hold on;
plot(w, 20 * log10(abs(h)), 'b', 'LineWidth', 1.5); % IIR filter in blue
plot(W_fir, 20 * log10(abs(H_fir)), 'r', 'LineWidth', 1.5); % FIR filter in red
hold off;

title('Amplitude Response of IIR (Butterworth) and FIR (Kaiser Window) Filters');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('IIR Filter (Butterworth)', 'FIR Filter (Kaiser Window)');
grid on;


%% The choice of low_cutoff_K = 0 is related to the FIR filter in the passband. Setting values in the range (0, 50) causes a longer rise time than expected - reaching zero at 50 Hz. In practice, this value is reached around 150 Hz. low_cutoff_B = 30 is the closest value to 50 Hz that meets the assumptions (the rise time is faster than that of the IIR filter).

%% The choice of beta = 8 (Kaiser window parameter) is a compromise ensuring a sufficiently steep slope in the passband while reducing sidelobe attenuation.
