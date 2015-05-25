function [ samples, frequencies, message ] = receiverV3( input_args )
%record a sound and output the frequency found

%period [s]
T=0.5;
%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = 16000;
out = [];
if nargin > 0
    y = input_args;
else
    recObj = audiorecorder(Fs, 8, 1);

    in = input('press any key to start recording');
    record(recObj);

    in = input('press any key to stop recording');

    stop(recObj);

    %play(recObj)

    y = getaudiodata(recObj);

end

samples = y;

L = length(y);


subplot(4,1,1)
plot(y);
title('received signal')

%filter noise in freq domaine
low_bound = 1000;
high_bound =  8000;

NFFT = 2^nextpow2(L(1)); % Next power of 2 from length of y
Y = fft(y,NFFT);
f = Fs*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
subplot(4,1,2)
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


% %Filter in frequency
filter=zeros(length(f),1);
for i = 1 : length(f)
    if f(i)> low_bound && f(i)< high_bound
        filter(i)=1;
    else
        filter(i)=0;
    end
end


filteredY = Y(1:NFFT/2 +1) .* filter;


%plot the result
% Plot single-sided amplitude spectrum.
subplot(4,1,3)
plot(f,2*abs(filteredY(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t) after filter')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

%go back to time domain
y = real(ifft(filteredY, NFFT));

subplot(4,1,4)
plot(real(y))
plot(y);
title('filtered signal')

y = y/max(y);

subplot(4,1,4)
plot(real(y))
plot(y);
title('normalized signal')


% minPeakHeight = 0.5;
% minPeakDist = floor(0.01*Fs);
% 
% %look for the first peaks
% [peaks, locations] = findpeaks(y, 'npeaks', 5,'MinPeakHeight',minPeakHeight, 'minpeakdistance', minPeakDist);
% 
% %first_peak = find(diff(y) > average);
% i = locations(1) + 4000;
% disp 'first location'
% disp(i)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEST FIND BEGINNING
i = 1;
d = 0;

while  strcmp(d, '22') ~= 1
    f = extract_freq(y(i:i+1028), Fs);
    disp (f)
    d = decode(f);
    i = i + 2000;
end

i = i+ Fs/2 - 1000;

disp i
disp(i)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% STOP


shortTime = [];

while i < length(y) -1000
   shortTime = [shortTime, y(i:(i+1028))];
   i = i + Fs * T;
   %disp i
   %disp(i);
end

l = size(shortTime);

han = [];
bitsArray = [];
for n = 1:l(2)

%    han = [han,shortTime(:, n) .* hanning(length(shortTime(:, n)))];
%     subplot(4,1,2);
%     plot(han);
%     title('han');
% 
%    Y=fft(han(:,n));
%    Mag=abs(Y(1:floor(length(han(:,n))/2))).^2;    
%    [a,b]=max(Mag);     
%    frequency = Fs*b/length(han(:,n));

    frequency = extract_freq(shortTime(:, n), Fs);
    out = [out; frequency*2];
%   d = decode(frequency);
%    if strcmp(d, '2222') == 1
%        break;
%    end
   bitsArray = [bitsArray,   decode(frequency)];
end;    

frequencies = out;

bits = [];

for i = 1:length(bitsArray)
   if bitsArray(i) ~= '2'   
       bits = [bits bitsArray(i)];
   end
end

disp(bits)
message = binToText(bits);
uiwait(msgbox(message, 'The decoded message', 'modal'))
    
end

