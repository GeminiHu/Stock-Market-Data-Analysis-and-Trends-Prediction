function [F,ab,ang]=Fourier(signal,Fs)
F = fft(signal);
subplot(2,1,1);
f = fftshift(F);
ab = abs(f);
ang = angle(f);
N = length(signal);
w = linspace(-Fs/2,Fs/2,N);
stem(w,ab,'Marker','none');
title('信号的幅频特性');
xlabel('频率（Hz)');
subplot(2,1,2);
plot(w,ang);
title('信号的相频特性');
xlabel('频率（Hz)');