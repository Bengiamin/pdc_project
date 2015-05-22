function [ text ] = binToText( bitsArray )
%Convert a binary string to a text string

if mod(bitsArray, 7) ~= 0
      bitsArray = bitsArray(1 : end - mod(bitsArray, 7));
end

bitsMatrix = reshape(bitsArray, 7, []) .';

disp(bitsMatrix);

text = '';

for i = 1:length(bitsMatrix)
    disp(bitsMatrix(i))
    c = char(bin2dec(bitsMatrix(i)))
      text = strcat(text, c)
end

disp(text); 


end

