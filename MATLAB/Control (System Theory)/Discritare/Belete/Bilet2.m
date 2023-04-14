close all, clear all
n=2;m=3;k=1;

H=zpk({-n+3}, {[0 -2 -m]}, k);

Ho=feedback(H,1)
figure, nyquist(Ho)

Hd=filt([1 -31],conv(conv( [1 -1],[1 59] ), [1 89] ))
figure, rlocus(Hd)

figure, step(Ho)

[num,dem]=tfdata(H,'v');
[gv,r]=deconv([num zeros(1,3)], dem)

A=[ 0 1 0; 0 0 1; 0 -6 -5]; B=[0;1;-6];
Co=ctrb(A,B);
rank(Co)