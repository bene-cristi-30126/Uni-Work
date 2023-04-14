load ('lab3_order2_6.mat')
plot(data),

K2_id=12/3, M=(15-12)/12; 
T0=40;
zeta=(abs(log(M)))/sqrt(pi^2+log(M)^2);
wn=2*pi/(T0*sqrt(1-zeta^2));

H2=tf(K2_id*wn^2,[1,2*zeta*wn,wn^2])

t_id=1:200;
y2_id=lsim(H2,data.u(1:200),t_id);

figure, plot(y2_id), hold on, plot(data.y)

t_val=201:500;
y_val=lsim(H2,data.u(201:500),t_val);
plot(201:500,y_val)

data_validare=data.u(201:500);
E_val=ones(1,length(data_validare));
MSE_VAL=0;
    for i=1:length(data_validare)
        j=i+200;
        E_val(i)=y_val(i)-data.y(j);
    end

    for n=1:length(E_val)
        MSE_VAL=MSE_VAL+E_val(n).^2,
    end
    MSE_VAL=MSE_VAL/n,
