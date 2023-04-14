load train
figure,plot([0:length(y)-1]/Fs,y), xlabel('t'), ylabel('x(t)')
sound(y,Fs)

N=2000; n=[0:N-1]; x=y(8000+n)';
figure,subplot(311), t=[0:N-1]/Fs;plot(t,x), axis([0 0.03 -1 1])
subplot(312), Xf=fft(x); plot(abs(Xf)/N), ylabel('Spectrul semnalului x')

    k1=[173 217 286]
    Ak=abs(Xf(k1))/N
    phik = angle(Xf(k1)) 
    fk=(k1-1)/N*Fs
    
z= 2*Ak(1)*cos(2*pi*fk(1)*t+phik(1))
    + 2*Ak(2)*cos(2*pi*fk(2)*t+phik(2))
    + 2*Ak(3)*cos(2*pi*fk(3)*t+phik(3));
subplot(311), hold on , plot(t,z,'g--'),
subplot(313), Xz=fft(z); plot(abs(Xz)/N,'g--'), ylabel('Spectrul semnalui z')