function [ frequencies, bits ] = receiverV2( input_args )
%record a sound and output the frequency found

    %period [s]
    T=1;
    %sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
    Fs = 8000;
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

    subplot(4,1,1)
    plot(y);
    title('recorded signal')

    first_peak = find(diff(y) > 0.4);
    i = first_peak(1) + 4000;
    disp i
    disp(i)
    shortTime = [];

  
    while i < length(y)
       shortTime = [shortTime, y(i:(i+1000))];
       i = i + Fs;
       %disp i
       %disp(i);
    end

    l = size(shortTime);

    han = [];
    bitsArray = [];
    for n = 1:l(2)

       han = [han,shortTime(:, n) .* hanning(length(shortTime(:, n)))];
       subplot(4,1,2);
       plot(han);
       title('han');
     
       Y=fft(han(:,n));
       Mag=abs(Y(1:floor(length(han(:,n))/2))).^2;    
       [a,b]=max(Mag);     
       frequency = Fs*b/length(han(:,n));
       out = [out; frequency*2];
       bitsArray = [bitsArray decode(frequency)];
    end;    
    frequencies = out;
    bits = bitsArray;
    
end

