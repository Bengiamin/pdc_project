function [ out ] = encoder(in)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

frequency = 0;
frequency =4;
if (in == 0) 
    frequency = 1000;
else
    frequency = 600;
end
T=1;
Fs=48000;
t = 0 : 1/Fs : T;
frequency2=330*4;
waveform = sin(pi*frequency*t/T);
waveform2 = sin(pi*frequency2*t/T);
waveform3 = waveform + waveform2;
disp(frequency);
plot(t,waveform)
sound(waveform3, Fs);
end

