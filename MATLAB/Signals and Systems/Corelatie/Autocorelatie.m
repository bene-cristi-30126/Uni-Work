N=128;
M=1000;
A=1;
n=0:N+M-1;
x=sin(2*pi*n/64)+A*randn(1,length(n));
phix=autocorr(x,N,M);
subplot(3,2,1);plot(x(1:N));grid;title('Sinus contaminat de zgomot')
subplot(3,2,2);plot(phix);grid;title('Autocorrelation function')
phix=phix/M;
x=sin(2*pi*n/64)+2*randn(1,length(n));
subplot(3,2,3);plot(x(1:N));grid;title('Sinus contaminat de zgomot, A=2')
subplot(3,2,4);plot(phix);grid;title('Autocorrelation function, A=2')
x=sin(2*pi*n/64)+3*randn(1,length(n));
subplot(3,2,5);plot(x(1:N));grid;title('Sinus contaminat de zgomot, A=3')
subplot(3,2,6);plot(phix);grid;title('Autocorrelation function, A=3')