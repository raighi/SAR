fe = 44100;     % fréquence d’échantillonnage
T = 1;          % période du signal (en s)
f0 = 1/T;       % fréquence fondamentale
N = fe * T;     % nombre d’échantillons sur 1 période
t = (0:N-1)/fe; % axe temporel

% Signal carré centré entre -1 et 1
carre = square(2*pi*f0*t);       

% Signal dent de scie centré entre -1 et 1
dent = sawtooth(2*pi*f0*t);     

Carre_fft = fftshift(fft(carre));
Dent_fft = fftshift(fft(dent));

f = linspace(-fe/2, fe/2, N);
Carre_dB = 20*log10(abs(Carre_fft) / N + eps);
Dent_dB = 20*log10(abs(Dent_fft) / N + eps);

figure;
subplot(2,1,1);
plot(f, Carre_dB);
title('Spectre du signal carré');
xlabel('Fréquence (Hz)'); ylabel('Amplitude (dB)'); grid on;
xlim([-100*f0 100*f0]);

subplot(2,1,2);
plot(f, Dent_dB);
title('Spectre du signal dent de scie');
xlabel('Fréquence (Hz)'); ylabel('Amplitude (dB)'); grid on;
xlim([-100*f0 100*f0]);
