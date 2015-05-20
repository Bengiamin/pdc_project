function [ freq ] = extract_freq( samples, Fs )
%from a small set of samples, extract the main frequency

Y= fft(samples);
spectrum = Y.*conj(Y)/length(Y);
%figure;
%plot(spectrum)


[~,b] = max(real(Y));

freq = Fs*b / length(samples);

disp freq
disp(freq)


end

