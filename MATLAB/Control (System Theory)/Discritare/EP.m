clear all
clear clc
close all

U1=220;
U21N=18;
I21N=8;

RSN=U21N/I21N
ku1=0.71;
kr=0.1;
u0=0.5;
%marimea de referinta a sursei
V0_ref=u0*0.2*U1

%L=2.25*10^(-3);
%C=0.008 *10^(-3);

L=2.25;
C=0.008;

%functia de transfer a partii fixe
num= U21N*sqrt(2)*ku1;
H=tf([num],[L*C L/RSN 1])
%bode(H)
Hf = tf(1,[L*C L/RSN 1])

%% PI
w=25.8;
tau=4/w
k=1/10^(9.3/20)
Regulator_PI=tf(k*[tau 1],[tau 0])
figure
step(feedback(H*Regulator_PI,kr)), legend('PI')
figure
bode(H*Regulator_PI), legend('PI')
zpk(Regulator_PI)
pid(Regulator_PI)
%% PD  
w0=20;
beta=0.1;
unghi=atand((1-beta)/(2*sqrt(beta)))
ph=-180+50-unghi
tau_d=1/(w0*sqrt(beta))
k=sqrt(beta)/(10^(-15/20))
Regulator_PD=tf(k*[tau_d 1],[beta*tau_d 1])
figure
step(feedback(H*Regulator_PD,kr)), legend('PD')
figure
bode(H*Regulator_PD), legend('PD')
zpk(Regulator_PD)
pid(Regulator_PD)
%% P
unghi=-180+50
k=1/(10^0.763/20) %0.06 pt essp=0
Regulator_P=tf(k,1)
step(feedback(H*Regulator_P,kr)), legend('P')
figure
bode(H*Regulator_P), legend('P')