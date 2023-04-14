x=[2 0 1 0], y=[0 2 2 0]
X=fft(x)
Y=fft(y)
Z=X.*Y
z=ifft(Z)
plot(z)