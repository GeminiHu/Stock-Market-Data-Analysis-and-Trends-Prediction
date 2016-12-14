function [F,ab,ang]=Fourier(signal,Fs)
F = fft(signal);
subplot(2,1,1);
f = fftshift(F);
ab = abs(f);
ang = angle(f);
N = length(signal);
w = linspace(-Fs/2,Fs/2,N);
stem(w,ab,'Marker','none');
title('�źŵķ�Ƶ����');
xlabel('Ƶ�ʣ�Hz)');
subplot(2,1,2);
plot(w,ang);
title('�źŵ���Ƶ����');
xlabel('Ƶ�ʣ�Hz)');