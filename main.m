clc

filename = 'audio.wav';
[x, fs] = audioread(filename);

[b, a] = bandPassFilter(fs,170,500,4,0);
y = filter(b,a,x);
freqz(a,b,fs);
fvtool(b, a, 'Fs', fs); % lol
