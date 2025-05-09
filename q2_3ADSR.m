fe = 44100;
T_total = 1.5;  % durée totale du son (en secondes)
t = 0:1/fe:T_total-1/fe;

% Durées en secondes
A = 0.1;  % attack
D = 0.2;  % decay
S = 0.7;  % sustain level
R = 0.3;  % release

N_A = round(A*fe);
N_D = round(D*fe);
N_S = round((T_total - (A+D+R))*fe);
N_R = round(R*fe);

% Segments
env_attack  = linspace(0, 1, N_A);
env_decay   = linspace(1, S, N_D);
env_sustain = S * ones(1, N_S);
env_release = linspace(S, 0, N_R);

% Enveloppe finale
env_adsr = [env_attack, env_decay, env_sustain, env_release];
env_adsr = [env_adsr, zeros(1, length(t) - length(env_adsr))];  % Padding si besoin

f0 = 220;  % La3
additive = zeros(size(t));
for n = 1:2:9  % harmoniques impairs
    additive = additive + (4/(n*pi)) * sin(2*pi*n*f0*t);
end
additive = additive .* env_adsr;
additive = additive / max(abs(additive));
audiowrite('additive_ADSR.wav', additive', fe);

source = sawtooth(2*pi*f0*t);
source_env = source .* env_adsr;

% Filtre passe-bas (designfilt)
d = designfilt('lowpassfir','FilterOrder',50,'CutoffFrequency',1000/(fe/2));
soustractive = filter(d, source_env);
soustractive = soustractive / max(abs(soustractive));
audiowrite('soustractive_ADSR.wav', soustractive', fe);

plot(t, env_adsr); title('Enveloppe ADSR'); xlabel('Temps (s)'); ylabel('Amplitude');
