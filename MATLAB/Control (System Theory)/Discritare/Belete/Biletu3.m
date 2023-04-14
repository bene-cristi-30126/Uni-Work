clear all,close all
n=1;m=1;k=1;

H=tf(n*conv([1,3],[1,-20]), 10*[1 15-m 0])

bode(H)

H0=feedback(k*H,1)
figure,step(H0)

Hd=c2d(H,1/140,'zoh')
Hdo=feedback(Hd,1)
figure, step(Hdo), hold on, step(H0)

[num,dem]=tfdata(H,'v');
[gv,r]=deconv([num zeros(1,3)], dem)
Ac=[0 -140;
    1 0]; Bc=[1;0]; C=[gv(2), gv(3)]; D=gv(1);