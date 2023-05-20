clc

disp('insert .wav file:');
[baseName, folder] = uigetfile('*.wav');
file = fullfile(folder, baseName);
[x,fs] = audioread(file);

choose = menu(strcat('Current FS = ',num2str(fs),'----','Want to change output sampling rate?'),'Yes','No');
if (choose == 1)
 fs_new = input('Enter the new output sampling rate:');
 y = resample(y,fs_new,fs);
 fs = fs_new;
end

disp('Insert The Gain for Each of the following Bandwidth in db : ');
gain1 = input('FROM 0 TO 170 Hz: ');
gain2 = input('FROM 170 TO 310 Hz: ');
gain3 = input('FROM 310 TO 600 Hz: ');
gain4 = input('FROM 600 TO 1000 Hz: ');
gain5 = input('FROM 1 TO 3 KHz: ');
gain6 = input('FROM 3 TO 6 KHz: ');
gain7 = input('FROM 6 TO 12 KHz: ');
gain8 = input('FROM 12 TO 14 KHz: ');
gain9 = input('FROM 14 TO 16 KHz: ');
gains = [gain1 gain2 gain3 gain4 gain5 gain6 gain7 gain8 gain9];

% filename = 'sample_mono.wav';
% [x, fs] = audioread(filename);

freqLow = [0, 170, 300, 610, 1005, 3000, 6000, 12000, 14000];
freqHigh = [170, 300, 610, 1005, 3000, 6000, 12000, 14000, 20000];
filterType = menu('Choose filter ','IIR','FIR');
  [a , b] = lowPassFilter(fs,170,1);
  filtered = filter(a, b, x);
  after_gain = filtered * gains(1);
  for i = 2:9
      f_low = freqLow(i);
      f_high = freqHigh(i);    
      [a, b] = bandPassFilter(fs,3000,6000,1);
      filtered = filter(a,b,x);
      after_gain = after_gain + filtered * gains(i);
  end
  
  sound(after_gain,fs);

