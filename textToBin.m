function [ bitsArray ] = textToBin( text )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


% s = size(text)
% 
% bitsMatrix = [];
% 
% for 1 = 0:s(2)
%    bitsMatrix(i, :) =   
%     
%     
% end
% 
% 
% 
% disp(bitsMatrix);
% s = size(bitsMatrix)
% 
% bitsMatrix = zeros(s(1), 8);
% 
% for i = 1 : s(1)
%     
%     %disp(bitsMatrix2(i,8-length(bitsMatrix(i, :))+1:end))
%     %disp(bitsMatrix(i, :))
%     bitsMatrix(i,8-length(bitsMatrix(i, :)+1:end)) = bitsMatrix(i, :);
%     
% end

%disp(bitsMatrix2);

bitsMatrix = dec2bin(text);
bitsArray = reshape( bitsMatrix.', 1, []);


end

