function [ bitsArray ] = textToBin( text )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


bitsMatrix = dec2bin(text);
bitsArray = reshape( bitsMatrix.', 1, []);


end

