close all, clear all
n=2;m=2; k=10*m;
H=zpk({-n/m}, {[-0.5*n+0.866*n*i, -0.5*n - 0.866*n*i]}, k, 'IOdelay',1/(2*n))

bode(H)

figure, nyquist(H)
Ho=feedback(H,1);
figure, step(Ho)

n=2;m=2; k=1;
H=zpk({-n/m}, {[-0.5*n+0.866*n*i, -0.5*n - 0.866*n*i]}, k, 'IOdelay',1/(2*n))
Hdiscret=c2d(H,1/10,'zoh')
figure, step(H), hold on, step(Hdiscret)

kd=10*m;
Hdo=feedback(kd*Hdiscret,1)
figure, step(Ho)

[num,dem]=tfdata(H,'v');
[gv,r]=deconv([num zeros(1,3)], dem)