clc
filename = 'sample_mono.wav';
[x, fs] = audioread(filename);
freqLow = [0, 170, 300, 610, 1005, 3000, 6000, 12000, 14000];
freqHigh = [170, 300, 610, 1005, 3000, 6000, 12000, 14000, 20000];
filterType = menu('Choose filter ','IIR','FIR');
 [al , bl] = lowPassFilter(fs,170,1);
  for i = 2:9
      f_low = freqLow(i);
      f_high = freqHigh(i);    
      [a, b] = bandPassFilter(fs,3000,6000,1);
      y = filter(b,a,x);
  end

