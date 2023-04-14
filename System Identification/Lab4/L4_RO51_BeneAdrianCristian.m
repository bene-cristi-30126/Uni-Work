clear all, close all
load ('lab4_order1_6.mat')
plot(data), data_validare=data.u(101:330)

K1=0.125/0.5;
ymax=0.285, y0=0.125; 
y_pt_t2=y0+0.368*(ymax-y0);
T1=5.38-3.84;

H1=ss(-1/T1, K1/T1, 1, 0) 

y1_val=lsim(H1,data_validare, t(101:330), y0);
figure, plot(data.y), hold on, plot(101:330,y1_val, 'm')

MSE1_VAL=0;
E1_val=(y1_val-data.y(101:330)).^2;
    for i=1:length(data_validare)
        MSE1_VAL=MSE1_VAL+E1_val(i)
    end
MSE1_VAL=MSE1_VAL/length(E1_val)

%%

load("lab4_order2_6.mat")
figure, plot(data), data_validare=data.u(101:330)

K2_id=2.7/0.5, M=(2.5-0.76)/(13.6-2.5), t1=1.56, t2=2.56; 
T0=2*(t2-t1);
zeta=(abs(log(M)))/sqrt(pi^2+log(M)^2);
wn=2*pi/(T0*sqrt(1-zeta^2));

[A,B,C,D] = tf2ss(K2_id*wn^2,[1,2*zeta*wn,wn^2])
H2=ss(A,B,C,D), X=[0; 0.03]; 

y2_val=lsim(H2,data_validare,t(101:330), X);
figure, plot(101:330,y2_val), hold on, plot(data.y)

MSE2_VAL=0;
    E2_val=(y2_val-data.y(101:330)).^2;
    for i=1:length(data_validare)
        MSE2_VAL=MSE2_VAL+E2_val(i);
    end
MSE2_VAL=MSE2_VAL/length(E2_val)