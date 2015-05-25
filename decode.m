function [ bitArray ] = decode( freq )
%return the bit array of n bits (4) closer to the given frequency

tmp = freq /100;
freq = 200* round(tmp);

bitArray = '0000';

switch freq
    case 3000
        bitArray = '0000';
    case 3200
        bitArray = '0001';
    case 3400
        bitArray = '0010';
    case 3600
        bitArray = '0011';
    case 3800
        bitArray = '0100';
    case 4000
        bitArray = '0101';
    case 4200
        bitArray = '0110';
    case 4400
        bitArray = '0111';
    case 4600
        bitArray = '1000';
    case 4800
        bitArray = '1001';
    case 5000
        bitArray = '1010';
    case 5200
        bitArray = '1011';
    case 5400
        bitArray = '1100';
    case 5600
        bitArray = '1101';
    case 5800
        bitArray = '1110';
    case 6000
        bitArray = '1111';
    case 7000
        bitArray = '22';
    otherwise
        bitArray = '2222';
end

end