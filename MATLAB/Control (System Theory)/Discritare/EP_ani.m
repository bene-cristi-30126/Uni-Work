clear all
clear clc
close all

U1=220;
U21N=24;
I21N=6;

RSN=U21N/I21N
ku1=0.8;
kr=0.2;
u0=0.5;
%marimea de referinta a sursei
V0_ref=u0*0.2*U1

% L=6e-04;
% C=5.2083e-04;

L=0.6;
C=0.05;

%functia de transfer a partii fixe
num= U21N*sqrt(2)*ku1;
H=tf([num],[L*C L/RSN 1])
bode(H)
Hf = tf(1,[L*C L/RSN 1])

%% PI
w=7.11;
tau=4/w
k=1/10^(27.1/20)
H_PI=tf(k*[tau 1],[tau 0])
figure
step(feedback(H*H_PI,kr))
bode(H*H_PI)
zpk(H_PI)
pid(H_PI)
%% PD  
w0=32.4;
beta=0.12;
unghi=atand((1-beta)/(2*sqrt(beta)))
ph=-180+50-unghi
tau_d=1/(w0*sqrt(beta))
k=sqrt(beta)/(10^(-1.09/20))
Hr_PD=tf(k*[tau_d 1],[beta*tau_d 1])
figure
step(feedback(H*Hr_PD,kr))
bode(H*Hr_PD)
zpk(Hr_PD)
pid(Hr_PD)
%% P
unghi=-180+50
k=1/(10^(24.4/20))
H_P=tf(k,1)
step(feedback(H*H_P,kr))
bode(H*H_P)