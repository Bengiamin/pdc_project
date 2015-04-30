function [ output ] = transmitter4by4( input )
%TRANSMITTER4BY4 Transform bits of an array into waveform and play it.
%   Each group of 4 bits is transmitted by one waveform.

 %partie inutile puisque l'on enverra des char codés sous 8 bits donc
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
    

    for j = 1:d(2)
        disp j
        disp(j);
        disp input_j;
        disp(input(:, j));
        if (input(:, j) == [0;0;0;0])   
            frequency = 466*4;
            disp 0;
        elseif (input(:, j) == [0;0;0;1])
            frequency = 262*4;
            disp 1;
        elseif (input(:, j) == [0;0;1;0])
            frequency = 330*4;
            disp 2;
        elseif (input(:, j) == [0;0;1;1])
            frequency = 392*4;   
            disp 3;
        elseif (input(:, j) == [0;1;0;0])
            frequency = 400*4;
            disp 4;
        elseif (input(:, j) == [0;1;0;0])
            frequency = 410*4;  
            disp 5;
        elseif (input(:, j) == [0;1;0;1])
            frequency = 420*4; 
            disp 6;
        else
            frequency = 430*4;  
            disp else;
        end    

        T=1;
        Fs=48000;
        t = 0 : 1/Fs : T;

        %Signals
        waveform1 = sin(pi*frequency*t/T);
        waveform = waveform1;

        %Play sound
        sound(waveform1, Fs);
        pause(1);
     end    

end

