function [ bitArray ] = decode( freq )
%return the bit array of n bits (4) closer to the given frequency

tmp = freq /100;
freq = 200* round(tmp);

bitArray = [0 0 0 0];

switch freq
    case 3000
        bitArray = [0 0 0 0];
    case 3200
        bitArray = [0 0 0 1];
    case 3400
        bitArray = [0 0 1 0];
    case 3600
        bitArray = [0 0 1 1];
    case 3800
        bitArray = [0 1 0 0];
    case 4000
        bitArray = [0 1 0 1];
    case 4200
        bitArray = [0 1 1 0];
    case 4400
        bitArray = [0 1 1 1];
    case 4600
        bitArray = [1 0 0 0];
    case 4800
        bitArray = [1 0 0 1];
    case 5000
        bitArray = [1 0 1 0];
    case 5200
        bitArray = [1 0 1 1];
    case 5400
        bitArray = [1 1 0 0];
    case 5600
        bitArray = [1 1 0 1];
    case 5800
        bitArray = [1 1 1 0];
    case 6000
        bitArray = [1 1 1 1];
    otherwise
        bitArray = [2 2 2 2];
end

end

