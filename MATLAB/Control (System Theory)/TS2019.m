close all
n=3; m=5;
H=tf(n,[1 m+n]); G=tf([-1 m], [1 0]);
k=1.8;
nyquist(k*H*G)
H0=feedback(k*H,G);
figure, step(H0)

Hd=c2d(H*G,1/80,'zoh')

figure, step(Hd)