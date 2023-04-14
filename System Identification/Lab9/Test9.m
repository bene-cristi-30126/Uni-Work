clear all, close all
load('lab9_1.mat')

na=n; nb=n;
N=length(id.y);

sys=arx(id,[na,nb,1]);
ysim=sim(sys,id.u);

Z=Zeta(id.u,ysim,na,nb);
Fi=Zeta(id.u,id.y,na,nb);

Fi_param=(1/N).*(Z'*Fi);
Yhat=(1/N).*(Z'*id.y);

Teta=Fi_param\Yhat;

A=[1 Teta(1:na)']; B=[ 0 Teta(na+1:na+nb)'];
model=idpoly(A,B,1,1,1,0,val.Ts)
compare(model,val,sys)