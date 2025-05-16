% Question 3.3
%charger le signal d'excitation
load("signal_excitation.mat");
r_xe1= xcorr(xe1,'coeff' );
r_xe2= xcorr(xe2,'coeff');
%vecteur Indices de décalage de longueur 2N-1
lags1= -length(xe1)+1:length(xe1)-1;
lags2= -length(xe2)+1:length(xe2)-1;

figure;
subplot(2,1,1);
plot(lags1, r_xe1); title('Autocorrélation de xe1');
xlabel('Décalage'); ylabel('Amplitude');

subplot(2,1,2);
plot(lags2, r_xe2); title('Autocorrélation de xe2');
xlabel('Décalage'); ylabel('Amplitude');

%question 3.4
%reponse impulsionnelle 
fe1=44100;
y=simule_piece(xe1,44100);
[R_xy, lags] = xcorr(y, xe1);

% Identifier l’indice correspondant à lag = 0
zero_idx = find(lags == 0);
% Extraire la partie causale (lags >= 0)
h_k = R_xy(zero_idx:end);

% Axe temporel pour affichage
t = (0:length(h_k)-1) / fe1;

% Affichage de la réponse impulsionnelle estimée
figure;
plot(t, h_k);
xlabel('Temps (s)');
ylabel('Amplitude');
title('Réponse impulsionnelle estimée');

%Question 3.5 et Question 3.6 Les deux dans des fichiers differents
%Question 3.5

%ENTREE : x=signal
%         h=la reponse impulsionnelle estimée
%SORTIE : x_conv=le signal convolué
%%
function[x_conv]=effet_reverb(x,h)
x_conv=conv(x,h);

end
%question 3.6
% test_effet_reverb.m

% Chargement du signal de guitare et de la réponse impulsionnelle 
%signal x et fréquence fe
audio="nylon-guitar.wav";
[x,fe]=audioread(audio);
%soundsc(X,fe);
%reponse impulsionnelle 
y=simule_piece(x,fe);
[R_xy, lags] = xcorr(y, x);

% Identifier l’indice correspondant à lag = 0
zero_idx = find(lags == 0);
% Extraire la partie causale (lags >= 0)
h_k = R_xy(zero_idx:end);


% Mesure du temps d'exécution
tic;
y = effet_reverb(x, h_k);  % appel à ta fonction
temps_execution = toc;

% Affichage du temps
fprintf('Temps execution de effet_reverb : %.4f secondes\n', temps_execution);
% Écoute du résultat
soundsc(y, fe);




%Question 3.7 effet_reverb_FFT


%ENTREE : x=signal
%         h=la reponse impulsionnelle estimée
%SORTIE : x_conv=le signal convolué
%%
function[y]=effet_reverb_FFT(x,h)
nfft=length(x)+length(h)-1;
x_fft= fft(x,nfft);
h_fft=fft(h,nfft);
y=ifft(h_fft.*x_fft);

end
%question 3.8 Test effet reverb FFT

% Chargement du signal de guitare et de la réponse impulsionnelle 
%signal x et fréquence fe
audio="nylon-guitar.wav";
[x,fe]=audioread(audio);
%soundsc(X,fe);
%reponse impulsionnelle 
y=simule_piece(x,fe);
[R_xy, lags] = xcorr(y, x);

% Identifier l’indice correspondant à lag = 0
zero_idx = find(lags == 0);
% Extraire la partie causale (lags >= 0)
h_k = R_xy(zero_idx:end);


% Mesure du temps d'exécution
tic;
y = effet_reverb_FFT(x, h_k);  % appel à ta fonction
temps_execution = toc;

% Affichage du temps
fprintf('Temps execution de effet_reverb : %.4f secondes\n', temps_execution);
% Écoute du résultat
soundsc(y, fe);


















