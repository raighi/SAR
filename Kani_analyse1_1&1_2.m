clear all; clc
%signal X
audio="nylon-guitar.wav";
[X,fe]=audioread(audio);
%soundsc(X,fe);
N=length(X);
X_fft= fft(X);
X_fft=fftshift(X_fft);
f = linspace(-fe/2,fe/2,N);

%Amplitude en decibels
A_db = 20*log10(abs(X_fft));

figure;
plot (f,A_db);
xlabel('frequence en Hz');
ylabel('Amplitude en db');
title('spectre du signal d une guitar');
grid on;
legend('visualisation');


%frequence fondamentale est la frequence du pic max
f_pos=f(f >0);
X_pos= abs(X_fft(f>0));
[~,indices_max] = max(X_pos);
f_1 =f_pos(indices_max);
%display('la frequence fondamentale est: ',f1)

%Question 2 

[x1, fe1] = audioread("single_tone_piano1.wav");
[x2, fe2] = audioread("single_tone_piano2.wav");
N1=length(x1);
N2=length(x2);
X1_fft=fftshift(fft(x1));
X2_fft=fftshift(fft(x2));
f1=linspace(-fe1/2,fe1/2,N1);
f2=linspace(-fe2/2,fe2/2,N2);

%Amplitude
A1_dB = 20*log10(abs(X1_fft) );
A2_dB = 20*log10(abs(X2_fft) );

figure;
plot(f1,A1_dB,f2,A2_dB);
xlabel('Frequence en Hz');
ylabel('Amplitude en decibels');
title('Visualisation du spectre du signal');
legend('spectre');

%frequence fondamentale
%piano 1
f_pos1=f1(f1 >0);
X_pos1= abs(X1_fft(f1>0));
[~,indices_max] = max(X_pos1);
f_1p =f_pos1(indices_max);
%piano 2
f_pos2=f2(f2 >0);
X_pos2= abs(X2_fft(f2>0));
[~,indices_max] = max(X_pos2);
f_2p =f_pos2(indices_max);

% Detection des 7 premiers pics 
[pks1, locs1] = findpeaks(X_pos1,f_pos1,'MinPeakHeight', max(X_pos1)*0.05,'MinPeakDistance', 0.8*f_1p);
[pks2, locs2] = findpeaks(X_pos2,f_pos2,'MinPeakHeight', max(X_pos2)*0.05,'MinPeakDistance', f_2p) ; 

% Extraire les 5 premiers
f_mesurees1 = locs1 (1:5); 
f_mesurees2 = locs2 (1:5); 
% frequences theoriques
n=1:5;
f_th1=n*f_1p;
f_th2=n*f_2p;
%degré Inharmonicité
E1=1200*(log2(f_mesurees1)-log2(f_th1));
E2=1200*(log2(f_mesurees2)-log2(f_th2));

% Question 1.3 
% x= somme de n= 1:8 (An*sin(2*pi*f_n*t)


%Question 1.4
A = linspace(0, 0.9, (length(signal)*0.10));     %rise 35% of signal
D = linspace(0.9, 0.7,(length(signal)*0.05));    %drop of 5% of signal
S = linspace(0.7, 0.7,(length(signal)*0.40));    %delay of 40% of signal
R = linspace(0.7, 0,(length(signal)*0.20));      %drop of 25% of signal
ADSR = [A D S R] ;
x = zeros(size(signal));
x(1:length(ADSR)) = ADSR;
tone=signal.* x;
audiowrite('singletone_piano_adrs.wav',tone,fe); %Ecriture du fichier son
soundsc(tone,fe);



