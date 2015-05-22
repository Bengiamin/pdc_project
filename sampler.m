function [ samples ] = sampler( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Fs = 16000;

    recObj = audiorecorder(Fs, 8, 1);

    in = input('press any key to start recording');
    record(recObj);

    in = input('press any key to stop recording');

    stop(recObj);

    %play(recObj)

    samples = getaudiodata(recObj);



end

