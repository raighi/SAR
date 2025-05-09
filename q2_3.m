fe = 44100;
T = 1;                     % durée du son
f0 = 220;                  % fréquence fondamentale
t = 0:1/fe:T-1/fe;

% Synthèse ADDITIVE : carrée approchée avec harmoniques impairs
N_harm = 9;  % nombre d’harmoniques
additive = zeros(size(t));
for n = 1:2:N_harm
    additive = additive + (4/(n*pi)) * sin(2*pi*n*f0*t);
end

env = exp(-5*t);  % enveloppe exponentielle
additive = additive .* env;
additive = additive / max(abs(additive));  % normalisation
audiowrite('synth_additive.wav', additive', fe);

source = sawtooth(2*pi*f0*t);
env = exp(-5*t);
source_env = source .* env;

% Filtre passe-bas
d = designfilt('lowpassfir','FilterOrder',50,'CutoffFrequency',1000/(fe/2));
soustractive = filter(d, source_env);
soustractive = soustractive / max(abs(soustractive));
audiowrite('synth_soustractive.wav', soustractive', fe);
