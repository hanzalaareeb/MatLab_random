
%____________________IMPORTING AUDIO SIGNAL_______________________________%
[y, Fs] = audioread("file_example_MP3_700KB.wav");
%soundsc(y, Fs)
 A = seconds(0:1/Fs:(size(y,1)-1)/Fs);   % create a duration vector t the--
 % same length as y to represent elapsed time

%_________________________________________________________________________% 
%adding impulsive noise to the audio signal

noisy_y = imnoise(y, 'salt & pepper', 0.005);  % ADDING NOISE TO THE ORIGNAL SIGNAL
% usinf IMNOISE() function adding impulsive noise('salt & paper') at the--
% density of 0.00025 per Fs.
%_________________________________________________________________________%
% soundsc(noisy_y, Fs) 

 B = seconds(0:1/Fs:(size(noisy_y,1)-1)/Fs);   % create a duration vector--
 % p the same length as y to represent elapsed time

%_________________________________________________________________________% 

%ploting signal y before addition of noise and after additiong of noise

 % subplot(2, 1, 1)
 % plot(A, y)
 % 
 % title("Example Signal 01(without noise)")
 % subplot(2, 1, 2)
 % plot(B, noisy_y)
 % title("Example Signal 01(with impulsive noise)")

%_________________________________________________________________________% 

%Remove impulse noise using Median Filter

filtered_signal_001 = medfilt1(noisy_y,90);      % Applying median filter
% soundsc(filtered_signal_001, Fs)
 C = seconds(0:1/Fs:(size(filtered_signal_001,1)-1)/Fs);   % create a duration vector--
 % C the same length as y to represent elapsed time
soundsc(filtered_signal_001, Fs)
%_________________________________________________________________________% 



subplot(3,1,1);
plot(A, y);            % Original Signal
title('Original Signal');
xlabel('Time (s)'); ylabel ('Amplitude');
subplot(3,1,2);
plot(B, noisy_y);          % noise signal
title('impulse noise Signal');
xlabel('Time (s)'); ylabel ('Amplitude');
subplot(3,1,3);
plot(C, filtered_signal_001);         % median Filtered output
title(' Median Filtered Signal');
xlabel('Time (s)'); ylabel ('Amplitude');





