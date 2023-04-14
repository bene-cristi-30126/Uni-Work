x=[ 1 2 3 4]
y=[0 1 2 3]
X=fft([x,zeros(1,length(y)-1)])
Y=fft([y,zeros(1,length(x)-1)])
Z=X.*Y
z=ifft(Z)

zlin=conv(x,y) 