function [ samples ] = sound_receiver( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

recObj = audiorecorder;

disp('Start speaking.')
recordblocking(recObj, 3);
disp('End of Recording.');


%play(recObj)

y = getaudiodata(recObj);

plot(y);


samples = y;

end

