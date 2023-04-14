clear all, close all
n=2; m=5;
H=tf(m*[1 1], n*conv([1,1],[1,2]),'IOdelay',0.05)

nyquist(10*H)

Ho=feedback(10*H,1)
step(Ho)

k=1/350;
figure, nichols(k*H)

Hd=c2d(H,0.05,'tustin')
rlocus(Hd)