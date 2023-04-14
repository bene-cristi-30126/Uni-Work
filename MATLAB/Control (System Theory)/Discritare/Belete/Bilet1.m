close all
n=1; m=2; k=1;

H=zpk({-n}, {[-(2*n+m), 0, n]}, k)

nyquist(H)

Ho=feedback(H,1)
figure, step(Ho)


Te=1/40; Hd=c2d(H,Te,'tustin')
figure, step(H), hold on, step(Hd)

figure, rlocus(Hd)

[num,dem]=tfdata(H,'v')
[gv,r]=deconv([num zeros(1,3)], dem)

A=[0 0  -3; 1 0 4; 0 1 0]; C=[ 0 1 -2];
Ob=obsv(A,C)
