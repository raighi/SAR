%Paramètres 
fe=44100;
f0=220.455;
Te=1/fe;
T=6;
N=fe*T;
t=(0:N-1)*Te; %Valeurs de temps d'échantillonage

signal=zeros(1,N);
for k=1:1:7
    signal=pks1(k)*signal+sin(2*pi*f0*k*t); %Ajout du signal à chaque temps d'échantillonage

end

signal=signal/max(abs(signal)); %Normalisation du signal

audiowrite('singletone_piano_corr3.wav',signal,fe); %Ecriture du fichier son

soundsc(signal,fe)
