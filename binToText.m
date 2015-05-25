function [ text ] = binToText( bitsArray )
%Convert a binary string to a text string


while mod(length(bitsArray), 8) ~= 0
      bitsArray = bitsArray(1 : end - 1);
      %disp(bitsArray);
end

bitsMatrix = reshape(bitsArray, 8, []) .';

disp(bitsMatrix);
s = size(bitsMatrix);

text = '';

for i = 1:s(1)
    %disp(bitsMatrix(i, :);
    if bitsMatrix(i, :) == '00100000'
        text = strcat(text, ' ');
    else
        c = char(bin2dec(bitsMatrix(i, :)));
        text = strcat(text, c);
    end
end

disp(text); 


end

