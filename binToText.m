function [ text ] = binToText( bitsArray )
%Convert a binary string to a text string


while mod(length(bitsArray), 8) ~= 0
      bitsArray = bitsArray(1 : end - 1);
      %disp(bitsArray);
end

bitsMatrix = reshape(bitsArray, 8, []) .';

disp(bitsMatrix);
s = size(bitsMatrix)

table = zeros(s(1), 1);

for i = 1:s(1)
    %disp(bitsMatrix(i, :))
    k = bin2dec(bitsMatrix(i, :));
    disp(k)
    table(i) = k;
end

text = char(table).';

disp(text); 


end

