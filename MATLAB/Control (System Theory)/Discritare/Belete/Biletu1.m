clear all, close all
n=2;m=1;k=1;

A=[m-13 3*m-32 2*(m-10);
    1 0 0;
    0 1 0]; B=[1;0;0]; C=[0 10 10*n]; D=0;
[num,dem]=ss2tf(A,B,C,D);
H=tf(k*num,dem)

%a
bode(H)

%e

Hd=c2d(H,1/60,'tustin')
Ho=feedback(k*H,1), Hdo=feedback(k*Hd,1)
figure, step(Ho), hold on, step(Hdo)

[gv,r]=deconv([num zeros(1,4)], dem);

Ac=[ 0 0 -18;
    1 0 -29;
    0 1 -12]; Bc=[1;0;0];

Co=ctrb(Ac,Bc)
rank(Co)
