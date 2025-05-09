% Fréquence d'échantillonnage
fe = 1000;
N = 1024;
omega = linspace(-pi, pi, N);

% Réponse théorique
H_theo = abs(cos(omega/2));

% Signal d'entrée : dirac
x = zeros(1, N);
x(1) = 1;

% Filtrage : y(k) = 0.5*(x(k) + x(k-1))
y = filter([0.5 0.5], 1, x);

% Spectre
Y = fftshift(fft(y));
f = linspace(-fe/2, fe/2, N);
Y_mag = abs(Y) / max(abs(Y));  % Normalisation

figure;
plot(omega, H_theo, 'r', 'DisplayName', 'Théorique');
hold on;
plot(2*pi*f/fe, Y_mag, 'b--', 'DisplayName', 'FFT numérique');
xlabel('\omega (rad)');
ylabel('Amplitude');
title('Réponse fréquentielle du filtre passe-bas');
legend;
grid on;
