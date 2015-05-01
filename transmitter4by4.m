function [ output ] = transmitter4by4( input )
%TRANSMITTER4BY4 Transform bits of an array into waveform and play it.
%   Each group of 4 bits is transmitted by one waveform.

 %partie inutile puisque l'on enverra des char cod�s sous 8 bits donc
    %l'input sera modulo 4.
    
    %padding if needed
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
    Fs = 16000;
    %samples vector
    t = 0 : 1/Fs : T;
    

    for j = 1:d(2)
        disp j
        disp(j);
        disp input_j;
        disp(input(:, j));
        if (input(:, j) == [0;0;0;0])   
            frequency = 3000;
            disp 0;
        elseif (input(:, j) == [0;0;0;1])
            frequency = 3200;
            disp 1;
        elseif (input(:, j) == [0;0;1;0])
            frequency = 3400;
            disp 2;
        elseif (input(:, j) == [0;0;1;1])
            frequency = 3600;   
            disp 3;
        elseif (input(:, j) == [0;1;0;0])
            frequency = 3800;
            disp 4;
        elseif (input(:, j) == [0;1;0;1])
            frequency = 4000;  
            disp 5;
        elseif (input(:, j) == [0;1;1;0])
            frequency = 4200; 
            disp 6;
        elseif (input(:, j) == [0;1;1;1])
            frequency = 4400;
            disp 7;
        elseif (input(:, j) == [1;0;0;0])
            frequency = 4600;
            disp 8;
        elseif (input(:, j) == [1;0;0;1])
            frequency = 4800;   
            disp 9;
        elseif (input(:, j) == [1;0;1;0])
            frequency = 5000;
            disp 10;
        elseif (input(:, j) == [1;0;1;1])
            frequency = 5200;  
            disp 11;
        elseif (input(:, j) == [1;1;0;0])
            frequency = 5400; 
            disp 12;
        elseif (input(:, j) == [1;1;0;1])
            frequency = 5600;
            disp 13;
        elseif (input(:, j) == [1;1;1;0])
            frequency = 5800;  
            disp 14;
        elseif (input(:, j) == [1;1;1;1])
            frequency = 6000; 
            disp 15;
        else
            frequency = 10000;  
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

