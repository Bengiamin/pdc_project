function [ freq ] = extract_freq( samples, Fs )
%from a small set of samples, extract the main frequency

   han = samples .* hanning(length(samples));
%    subplot(4,1,2);
%    plot(han);
%    title('han');

   Y=fft(han);
   Mag=abs(Y(1:floor(length(han)/2))).^2;    
   [a,b]=max(Mag);     
   freq = Fs*b/length(han);

end

