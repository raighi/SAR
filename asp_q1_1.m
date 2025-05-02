[instrument, fe] = audioread('sons\nylon-guitar.wav'); % fe = fréquence d’échantillonnage
instrument = instrument(:,1); % Garder un seul canal (mono)
N = length(instrument);
X = fft(instrument);          % Transformée de Fourier
X_shifted = fftshift(X);      % Centrer le spectre
f = linspace(-fe/2, fe/2, N); % Axe des fréquences

amplitude_db = 20*log10(abs(X_shifted) + eps); % Amplitude en dB (+eps pour éviter log(0))

figure(1)
plot(f, amplitude_db);
xlabel('Fréquence (Hz)');
ylabel('Amplitude (dB)');
title('Spectre en amplitude en dB - Guitare');
grid on;

[~, index_max] = max(abs(X));        % Pic de plus forte amplitude
freq_fondamentale = (index_max - 1) * fe / N; % Fréquence correspondante
fprintf("Fréquence fondamentale estimée : %.2f Hz\n", freq_fondamentale);

[instrument, fe] = audioread('sons\piano_chord.wav'); % fe = fréquence d’échantillonnage
instrument = instrument(:,1); % Garder un seul canal (mono)
N = length(instrument);
X = fft(instrument);          % Transformée de Fourier
X_shifted = fftshift(X);      % Centrer le spectre
f = linspace(-fe/2, fe/2, N); % Axe des fréquences

amplitude_db = 20*log10(abs(X_shifted) + eps); % Amplitude en dB (+eps pour éviter log(0))

figure(2)
plot(f, amplitude_db);
xlabel('Fréquence (Hz)');
ylabel('Amplitude (dB)');
title('Spectre en amplitude en dB - Piano');
grid on;

[~, index_max] = max(abs(X));        % Pic de plus forte amplitude
freq_fondamentale = (index_max - 1) * fe / N; % Fréquence correspondante
fprintf("Fréquence fondamentale estimée : %.2f Hz\n", freq_fondamentale);


