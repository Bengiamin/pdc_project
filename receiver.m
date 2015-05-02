function [ output ] = receiver( input_args )
%record a sound and output the samples after a frequency filter

%period [s]
T=1;
%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = 16000;
low_bound = 2500;
high_bound =  8000;

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



subplot(4,1,1)
plot(y);
title('recorded signal')


%get fft
Y = fft(y);



%filter all unwanted freq
%create lowpass filter from biggest freq in Y
Y_max =  2^nextpow2(length(y)) / 2 +1 ;
frequencies = Fs/2 * linspace(0, 1, Y_max);


Pyy = Y.*conj(Y)/length(Y);
subplot(4,1,2)
plot(frequencies,Pyy(1:Y_max))
title('Power spectral density')
xlabel('Frequency (Hz)')
%axis([0,8000, 0, 2])

low = 1;
high = Y_max;
while frequencies(low) < low_bound
    low = low +1;
end
while frequencies(high) > high_bound
    high = high-1;
end

filter = zeros(Y_max, 1);
filter(low:high) = ones(high-low +1, 1);

filteredY = Y(1:Y_max) .* filter;


Pyy = filteredY.*conj(filteredY)/length(filteredY);
subplot(4,1,3)
plot(frequencies,Pyy(1:Y_max))
title('Power spectral density after filter')
xlabel('Frequency (Hz)')

%go back to time domain to separate in periods
filteredy = real(ifft(filteredY));

subplot(4,1,4)
plot(real(filteredy))


%Find peaks

[peaks, locations] = findpeaks(filteredy, 'npeaks', 10,'MinPeakHeight',0.2)
disp(peaks)
disp(locations)





%split in period samples

%extract frequencies from the first set of signals

%while not end freq, decode freq and bit step by step

%outpu bits



end

