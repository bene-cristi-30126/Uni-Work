clear all,close all
n=1;m=1;k=1;
H=tf([1,m],conv([1,1],[-1,n]),'IOdelay',0.05)
nyquist(H)

Ho=feedback(k*H,1)
figure,bode(Ho)

[re,pol,dir]=residue([-1 -1],[1 0 -1])