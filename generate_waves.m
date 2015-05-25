function [ output ] = generate_waves(input, T, Fs )
%GENERaTE_WAVES Waveformer for codeword input
%   Detailed explanation goes here

%disp(size(input));

if strcmp(input, '0000') == 1
    frequency = 3000;
    %disp 0;
elseif strcmp(input, '0001') == 1
    frequency = 3200;
    %disp 1;
elseif strcmp(input, '0010') == 1
    frequency = 3400;
    %disp 2;
elseif strcmp(input, '0011') == 1
    frequency = 3600;   
    %disp 3;
elseif strcmp(input, '0100') == 1
    frequency = 3800;
    %disp 4;
elseif strcmp(input, '0101') == 1
    frequency = 4000;  
    %disp 5;
elseif strcmp(input, '0110') == 1
    frequency = 4200; 
    %disp 6;
elseif strcmp(input, '0111') == 1
    frequency = 4400;
    %disp 7;
elseif strcmp(input, '1000') == 1
    frequency = 4600;
    %disp 8;
elseif strcmp(input, '1001') == 1
    frequency = 4800;   
    %disp 9;
elseif strcmp(input, '1010') == 1
    frequency = 5000;
    %disp 10;
elseif strcmp(input, '1011') == 1
    frequency = 5200;  
    %disp 11;
elseif strcmp(input, '1100') == 1
    frequency = 5400; 
    %disp 12;
elseif strcmp(input, '1101') == 1
    frequency = 5600;
    %disp 13;
elseif strcmp(input, '1110') == 1
    frequency = 5800;  
    %disp 14;
elseif strcmp(input, '1111') == 1
    frequency = 6000; 
    %disp 15;
else
    frequency = 7000;  
    %disp else;
end    

%samples vector
t = 0 : 1/Fs : T;

output = sin(pi*frequency*t);



