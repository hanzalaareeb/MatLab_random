clc;
close all;
clear;

[Clean, Fs2] = audioread('file_example_MP3_700KB.mp3');
[sample_data, sample_rate] = audioread("noisy_y.mp3");

signal = medfilt1(sample_data,35);      % Applying median filter

%_______________________________________________________________________________%
% Fs = sample_rate;                       % Sampling Frequency (Hz)
% Fn = Fs/2;                              % Nyquist Frequency (Hz)
% Wp = 1000/Fn;                           % Passband Frequency (Normalised)
% Ws = 1001/Fn;                           % Stopband Frequency (Normalised)
% Rp = 10;                                % Passband Ripple (dB)
% Rs = 120;                               % Stopband Ripple (dB)
% [n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);         % Filter Order
% [z,p,k] = cheby2(n,Rs,Ws,'low');        % Filter Design
% [soslp,glp] = zp2sos(z,p,k);    % Convert To Second-Order-Section For Stability
% 
% filtered_sound2 = filtfilt(soslp, glp, signal);
% %_______________________________________________________________________________%

% fs2_d = [filtered_sound2,filtered_sound2];
% 
% sound(fs2_d, sample_rate)

subplot(4,1,1);
plot(sample_data);            % Original Signal
title('Original Signal');
xlabel('Time (s)'); ylabel ('Amplitude');

subplot(4,1,2);
plot(signal);          % Filtered output
title('Filtered Signal Double');
xlabel('Time (s)'); ylabel ('Amplitude');

% subplot(4,1,3);
% plot(fs2_d);         % Filtered output
% title('Filtered Signal Double');
% xlabel('Time (s)'); ylabel ('Amplitude');

subplot(4,1,4);
plot(Clean);                  % Expected output
title('Expected Signal');
xlabel('Time (s)'); ylabel ('Amplitude');
