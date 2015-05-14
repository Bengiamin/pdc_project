function [ output, samples_subset ] = receiver( input_args )
%record a sound and output the samples after a frequency filter


%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = 8000;
end_freq = 7000;
minPeakHeight = 0.2;

low_bound = 1000;
high_bound =  Fs;

T=1;

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
% figure;
% disp hello
% plot(Y);
% title('grand Y test');
% pause();

%filter all unwanted freq
%create lowpass filter from biggest freq in Y
Y_max =  2^nextpow2(length(y)) / 2 +1 ;
frequencies = Fs/2 * linspace(0, 1, Y_max);


%plot the result
Pyy = (Y.*conj(Y))/length(Y);
subplot(4,1,2)
plot(frequencies,Pyy(1:Y_max))
title('Power spectral density')
xlabel('Frequency (Hz)')

axis([0,Y_max, 0, 2])


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


%plot the result
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

[peaks, locations] = findpeaks(filteredy, 'npeaks', 2,'MinPeakHeight',minPeakHeight)
%disp(peaks)
%disp(locations)

%split in period samples
%split from locations(1)+0.5*T until the end

period = T * Fs /2;

period = Fs;
endpoint = size(filteredy) - mod(size(filteredy(locations(1):end)), period );

% disp(size(filteredy))
% disp(size(filteredy(locations(1):end)))
% disp(size(filteredy(locations(1):endpoint)))
% disp(mod(size(filteredY(locations(1):end)), period ))
% disp(period)


samples_subset = reshape(filteredy(locations(1):endpoint), period, []);

nfreq = size(samples_subset);
nfreq = nfreq(2)
%extract frequencies from the each subsamples of signals
%figure;

%disp(nfreq(2))

freq = zeros([nfreq, 1]);

%set bounds for the freq analysis

for i = 1:nfreq
    f = extract_freq(samples_subset(:,i));
    if f == end_freq
        freq = freq(1:i-1);
        break;
    end
    freq(i,1) = f;
    %subplot(6,1,i)
    %plot(samples_subset(:,i))
    
end


%decode all frequencies freq and bit step by step

bitarray = [];



for i = 1:nfreq

   bitarray = [bitarray decode(freq(i))];

end

disp bit_array;
disp(bitarray)

% 
% figure; 
% plot(bitarray)

%output bits



end

