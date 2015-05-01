function [ samples ] = receiver( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%duration [s]
T=1;
%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = 48000;

recObj = audiorecorder;

in = input('start recording');
record(recObj);

in = input('stop recording');
stop(recObj);

%play(recObj)

y = getaudiodata(recObj);

plot(y);
samples = y;

%get fft
Y = fft(y)


%filter all unwanted freq

%back to time, remove all amplitude lower than x

%Get first non zero value

%split un period samples

%extract frequencies from the first set of signals

%while not end freq, decode freq and bit step by step

%outpu bits



end

