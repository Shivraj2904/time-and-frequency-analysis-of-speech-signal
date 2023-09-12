
% Load speech signal 
[speech, fs] = audioread( "C:\Users\shivr\Documents\MATLAB\male voice.mp3");
sound(speech,fs)
% "C:\Users\shivr\Documents\MATLAB\male voice.mp3"
% "C:\Users\shivr\Documents\MATLAB\female voice.mp3"

subplot(3,1,1)
stem(speech)
xlabel('time');
ylabel('Amplitude');
title('Input Speech Signal ');

% Time domain analysis

% Calculate duration of the signal in seconds
duration = length(speech) / fs; 
% Time axis in seconds
time_axis = (0:duration/(length(speech)-1):duration);  
disp("duration : ")
disp(duration);

% Plot the speech signal in the time domain
subplot(3,1,2)
plot(time_axis, speech);
xlabel('Time (s)');
ylabel('Amplitude');
title('Speech Signal in Time Domain');

% Frequency domain analysis 

% Next power of 2 for better FFT performance
nfft = 2^nextpow2(length(speech)); 
% Frequency axis in Hz
frequencies = fs/2 * linspace(0, 1, nfft/2 + 1); 

% Compute the single-sided amplitude spectrum
speech_fft = fft(speech, nfft);
amplitude_spectrum = 2 * abs(speech_fft(1:nfft/2 + 1));

% Plot the speech signal in the frequency domain
subplot(3,1,3)
plot(frequencies, amplitude_spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Speech Signal in Frequency Domain');


