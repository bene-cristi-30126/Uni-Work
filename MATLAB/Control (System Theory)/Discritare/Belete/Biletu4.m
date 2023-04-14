clear all, close all
n=3;m=3;

H=tf([2 2*(m-10) 0],conv([1,1],[1,2*n]))

bode(H)

Ho=feedback(1*H,1)
figure, bode(Ho)

Hd=filt(2*conv([1,-1],[1,-1-7/60]), conv([1,-1+1/60],[1,-1+1/10]))

[num,dem]=tfdata(H,'v')
[gv,r]=deconv([[-28 -12] zeros(1,3)], [1 7 6])

A=[0 1; -6 -7]; B=[-28;184];
Co=ctrb(A,B)
rank(Co)

K=acker(A,B,pole(H))
