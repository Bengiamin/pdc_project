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
waveform = sin(pi*frequency*t/T);
disp(frequency);
plot(t,waveform)
sound(waveform, Fs);
end

