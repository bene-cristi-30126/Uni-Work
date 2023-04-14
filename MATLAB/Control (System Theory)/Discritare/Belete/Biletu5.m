close all, clear all
n=1;m=1;

H=tf(100*m^2*[1 10*n], conv([1,n],[1, (2*m^2)/15 100*m^2]))

bode((1/350)*H)

Ho=feedback(0.01*H, 1)
figure, step(Ho)

essp=1-evalfr(Ho,0)

Hd=c2d(H,0.01,'zoh')
figure, rlocus(Hd)

[num,dem]=tfdata(H,'v')
[gv,r]=deconv([num zeros(1,3)], dem)

gv(1)=[];
A=[ 0 1 0;
    0 0 1;
    -100 -100.1 -1.133]; C=[1 0 0]; B=gv';

Ob=obsv(A,C); rank(Ob)
L=acker(A,B,10*pole(H))