N = 1024;
x = zeros(1, N); 
x(1) = 1;  % impulsion de Dirac

% Filtrage
b = [0.5 0.5];
a = 1;
y = filter(b, a, x);

Y = fftshift(fft(y));
f = linspace(-pi, pi, N); % fréquence réduite entre -π et π
Y_mag = abs(Y) / max(abs(Y));  % normalisation

H_theo = abs(cos(f/2));

figure;
plot(f, Y_mag, 'b--', 'DisplayName', 'FFT numérique');
hold on;
plot(f, H_theo, 'r', 'DisplayName', 'Réponse théorique');
xlabel('\omega (rad)');
ylabel('Amplitude');
title('Spectre du filtre passe-bas y(k) = 0.5(x(k) + x(k-1))');
legend; grid on;
