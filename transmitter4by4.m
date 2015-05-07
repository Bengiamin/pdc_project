function [ output ] = transmitter4by4( input )
%TRANSMITTER4BY4 Transform bits of an array into waveform and play it.
%   Each group of 4 bits is transmitted by one waveform.

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
    Fs = 48000;  
    
    %waveform for binary PSK modulation coresponding 4-ary information
    waveform = [];
    for j = 1:d(2)
      waveform = [waveform,generate_waves(input(:, j), T, Fs)];
    end   
    
    %Play sound
    plot(waveform);
    sound(waveform, Fs);
end

