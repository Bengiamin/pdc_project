function [ out ] = encoder(in, T)
%UNTITLED Summary of this function goes here
%   Encode the input of k bits into one specific waveform and play it for T
%   seconds

frequency = 0;
frequency =4;
if (in == 0) 
    frequency = 466*4;
else
    frequency = 262*4;
end

frequency2 = 330*4
frequency3 = 392*4
T=1;
Fs=48000;
t = 0 : 1/Fs : T;
waveform1 = sin(pi*frequency*t/T);
waveform2 = sin(pi*frequency2*t/T);
waveform3 = sin(pi*frequency3*t/T);
waveform = waveform1 + waveform2 + waveform3;
disp(frequency);
plot(t,waveform)
sound(waveform, Fs);
end

