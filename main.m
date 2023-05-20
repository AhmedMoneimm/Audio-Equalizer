clc

filename = 'audio.wav';
[x, fs] = audioread(filename);

[a, b] = bandPassFilter(fs,170,500,4,0);
y = filter(b,a,x);
freqz(a,b,fs);
