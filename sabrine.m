function [ output_args ] = sabrine( input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

message = [];
l = (length(input)/4)
for n = 1:l
    message = [message, binToText(input(n:n+3))];
    n= n+4
end
output_args = message;

