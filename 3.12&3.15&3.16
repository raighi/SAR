% analyse_delay.m
% Script pour afficher la réponse impulsionnelle d'un filtre à retard récursif

clear; clc;
load("signal_excitation.mat");
% --- Paramètres du filtre ---
M = 100; % Longueur de la réponse impulsionnelle à afficher
N=100;
tau = 10;      % Retard (en échantillons)
g = 0.8;       % Coefficient de rétroaction
fe=44100;
% --- Création du signal d'entrée : une impulsion unité ---
x = zeros(N, 1);
x(1) = 1;      % delta(k)

% --- Définition des vecteurs a et b ---
b = zeros(M, 1);
b(1) = 1;

a = zeros(N, 1);
a(1) = 1;
a(tau+1) = g;

% --- Application du filtre ---
h = filter(b, a, x);   % h est la réponse impulsionnelle du filtre


% --- Affichage de la réponse impulsionnelle ---
%stem(0:N-1, h, 'filled');
%xlabel('k');
%ylabel('h(k)');
%title('reponse h(k) du filtre ');
%grid on;
%soundsc(h, fe);

%3.14

% Réponse fréquentielle numérique
H_num = abs(fft(h));
nu = linspace(0, 1, N);

% Réponse fréquentielle théorique
H_th = 1 ./ sqrt(1 + g^2 + 2*g*cos(2*pi*nu*tau));

% Tracé comparatif
figure;
plot(nu, H_th, 'r', 'LineWidth', 1.5); hold on;
plot(nu, H_num, 'b--');
xlabel('\nu (fréquence réduite)');
ylabel('module de h');
legend('Théorique', 'Numérique');
title('Comparaison module ');
grid on;



% 3.15
function y = effet_delay(x, delay_sec, g, fe)
% effet_delay - Applique un effet de delay récursif sur un signal audio
%
% Entrées :
%   x         : signal d’entrée (vecteur colonne)
%   delay_sec : retard en secondes
%   g         : coefficient de rétroaction (|g| < 1)
%   fe        : fréquence d’échantillonnage (en Hz)
%
% Sortie :
%   y         : signal filtré avec delay récursif

    x = x(:);                  % s'assurer que x est un vecteur colonne
    N = length(x);             % longueur du signal
    tau = round(delay_sec * fe);  % conversion du temps en échantillons

    % Initialisation des vecteurs a et b
    M = N + tau;               % longueur maximale pour contenir tous les effets
    a = zeros(M, 1);
    b = zeros(M, 1);
    a(1) = 1;
    a(tau + 1) = g;
    b(1) = 1;

   

    % Application du filtre
   
    y = filter(b, a, x);

    % Troncature pour retrouver la longueur initiale
    y = y(1:N);
end
%3.16
[x, fe] = audioread('single_tone_piano1.wav');
soundsc(x, fe);


pause(length(x(:,1))/fe+1);%attendre avant de jouer le deuxieme son

y = effet_delay(x, 0.25, 0.9, fe);
soundsc(y, fe);



