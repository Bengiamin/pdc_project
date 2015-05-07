function [ output ] = generate_waves(input, T, Fs )
%GENERaTE_WAVES Waveformer for codeword input
%   Detailed explanation goes here

if (input == [0;0;0;0])   
    frequency = 3000;
    disp 0;
elseif (input == [0;0;0;1])
    frequency = 3200;
    disp 1;
elseif (input == [0;0;1;0])
    frequency = 3400;
    disp 2;
elseif (input == [0;0;1;1])
    frequency = 3600;   
    disp 3;
elseif (input == [0;1;0;0])
    frequency = 3800;
    disp 4;
elseif (input == [0;1;0;1])
    frequency = 4000;  
    disp 5;
elseif (input == [0;1;1;0])
    frequency = 4200; 
    disp 6;
elseif (input == [0;1;1;1])
    frequency = 4400;
    disp 7;
elseif (input == [1;0;0;0])
    frequency = 4600;
    disp 8;
elseif (input == [1;0;0;1])
    frequency = 4800;   
    disp 9;
elseif (input == [1;0;1;0])
    frequency = 5000;
    disp 10;
elseif (input == [1;0;1;1])
    frequency = 5200;  
    disp 11;
elseif (input == [1;1;0;0])
    frequency = 5400; 
    disp 12;
elseif (input == [1;1;0;1])
    frequency = 5600;
    disp 13;
elseif (input == [1;1;1;0])
    frequency = 5800;  
    disp 14;
elseif (input == [1;1;1;1])
    frequency = 6000; 
    disp 15;
else
    frequency = 7000;  
    disp else;
end    

%samples vector
t = 0 : 1/Fs : T;

output = sin(pi*frequency*t/T);



