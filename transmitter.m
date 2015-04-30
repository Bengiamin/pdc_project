function [ output_args ] = untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%partie inutile puisque l'on enverra des char cod�s sous 8 bits donc
%l'input sera modulo 4.
d=size(input);
modu = mod(d,4);
modulo = modu(2);
if (modulo == 1)
    input = cat(2,input,[0,0,0]);
elseif (modulo == 2)
    input =cat(2,input, [0,0]);
elseif (modulo == 3)
    input = cat(2,input,[0]);
end
input =(reshape(input, 4, []));
d= size(input);

%duration [s]
T=1;
%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = 48000;
%samples vector
t = 0 : 1/Fs : T;
%Frequency [Hz]
for j = 1:d(2)
    for i = 1:d(1)
        if (input(4*(j-1) + i) == 0) 
            frequency = 466*4;
        else
            frequency = 262*4;
        end

        frequency2 = 330*4
        frequency3 = 392*4
        T=1;
        Fs=48000;
        t = 0 : 1/Fs : T;

        %Signals
        waveform1 = sin(pi*frequency*t/T);
        waveform2 = sin(pi*frequency2*t/T);
        waveform3 = sin(pi*frequency3*t/T);
        waveform = waveform1;

        %Play sound
        sound(waveform1, Fs);
        pause(1);
        end
    end    
end
    

