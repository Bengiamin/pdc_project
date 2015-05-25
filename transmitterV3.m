function [ output ] = transmitterV3( input )
%TRANSMITTER4BY4 Transform bits of an array into waveform and play it.
%   Each group of 4 bits is transmitted by one waveform.


    if nargin == 0
         input = dialogBox();
    end
    
    if isempty(input)
       return; 
    end
    
    % assume the input is divisible by 4
    
    input = textToBin(char(input));


    %padding if needed
    d=length(input);
    modulo = mod(d,4);
    %disp(modulo)
    %disp(input)

    %modulo = modu(2);
    if (modulo == 1)
        input = strcat(input,'000');
    elseif (modulo == 2)
        input = strcat(input, '00');
    elseif (modulo == 3)
        input = strcat(input,'0');
    end
    
    %disp(input)
    
    input = reshape(input, 4, []);
    input = transpose(input);
    d = size(input);

    disp(input)
    
    %duration [s]
    T=0.5;
    %sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
    Fs = 16000;  
    
    %waveform for binary PSK modulation coresponding 4-ary information
    waveform = generate_waves('2222' , T, Fs);
    
    for j = 1:d(1)
      waveform = [waveform,generate_waves(input(j, :), T, Fs)];
    end   
    
    waveform = [waveform, generate_waves('2222' , T, Fs)];
    
    %Play sound
    plot(waveform);
    sound(waveform, Fs);
end

