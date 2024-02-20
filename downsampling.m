clc;
clear;
close all;
set(0, 'DefaultFigureVisible', 'on');
[y, Fs] = audioread("teste_01.wav");
A = seconds(0:1/Fs:(size(y,1)-1)/Fs);

% Generate random noise
y_2 = 0.25 * randi(5, length(y), 2);
normalized_data = y_2 / max(y_2);
normal_y_2 = (normalized_data - 0.5) * 3;

% Add zeros to normal_y_2
num_zeros = 300000;
normal_y_2_padded = padarray(normal_y_2, [num_zeros, 0], 'pre');
normal_y_2_padded_rounded = round(normal_y_2_padded);

% Combine signal with noise
noise_y2 = y + normal_y_2_padded_rounded(1:length(y), 1);



B = seconds(0:1/Fs:(size(noise_y2, 1)-1)/Fs);

% Applying median filter to the combined signal
window_size = 51; % Adjust this value as needed
filtered_signal = medfilt1(noise_y2, window_size);

% Plotting
figure 
subplot(3, 1, 1)
plot(A, y)
title('Original Signal')

subplot(3, 1, 2)
plot(B, noise_y2)
title('Noisy Audio Signal')

subplot(3, 1, 3)
plot(B, filtered_signal)
title('Median Filtered Signal')
soundsc(filtered_signal)