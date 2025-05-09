% Paramètres
fe = 10000;            % fréquence d’échantillonnage
T = 1;                 % période du signal carré
f0 = 1/T;              % fréquence fondamentale
t = 0:1/fe:2*T;        % 2 périodes pour bien voir
carre = square(2*pi*f0*t);  % Signal carré parfait

% Approximation par série de Fourier
approx = zeros(size(t));
N_harm = 9;  % nombre d’harmoniques impairs à utiliser

for n = 1:2:N_harm  % seulement les harmoniques impairs
    approx = approx + (4/(n*pi)) * sin(2*pi*n*f0*t);
end

% Affichage
figure;
plot(t, carre, 'k', 'LineWidth', 1.2, 'DisplayName', 'Signal carré (square)');
hold on;
plot(t, approx, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Série de Fourier (N = 9)');
xlabel('Temps (s)');
ylabel('Amplitude');
legend;
title('Signal carré vs. approximation par série de Fourier');
grid on;

% Paramètres
fe = 10000;            % fréquence d’échantillonnage
T = 1;                 % période
f0 = 1/T;              % fréquence fondamentale
t = 0:1/fe:2*T;        % 2 périodes

% Signal dent de scie MATLAB (de -1 à 1)
dent = sawtooth(2*pi*f0*t + pi);  % Centrage temporel

% Approximation par série de Fourier
approx = zeros(size(t));
N_harm = 15;  % nombre d’harmoniques

for n = 1:N_harm
    approx = approx + (-2*(-1)^n)/(n*pi) * sin(2*pi*n*f0*t);
end

% Affichage
figure;
plot(t, dent, 'k', 'LineWidth', 1.2, 'DisplayName', 'Signal dent de scie (sawtooth)');
hold on;
plot(t, approx, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Série de Fourier (N = 15)');
xlabel('Temps (s)');
ylabel('Amplitude');
legend;
title('Signal dent de scie vs. approximation par série de Fourier');
grid on;
