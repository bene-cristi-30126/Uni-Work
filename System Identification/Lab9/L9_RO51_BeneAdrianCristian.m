close all, clear all
load("lab9_1.mat")

na=n;nb=n;
N=length(id.y);

sys=arx(id,[na,nb,1])
ysim=sim(sys,id.u);

Z=Zeta(id.u,ysim,na,nb);  %Zeta e cu simulare
Fi=Zeta(id.u,id.y,na,nb);

Fi_param=(1/N).*(Z'*Fi);
Yhat=(1/N).*(Z'*id.y);

Teta=Fi_param\(Yhat); 

A = [1 Teta(1:n, 1)'];      % 1:n
B = [0 Teta(n+1:2*n, 1)'];  % n+1 pana la n la a 2 a
model=idpoly(A,B,[],[],[])
figure, compare(model,val,sys)