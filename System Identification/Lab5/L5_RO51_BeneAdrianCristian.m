clear all, close all
load ('lab5_6.mat')

plot(id) % grafic inital al valorilor de identificare 
figure, plot(val) % grafic initial al valorilor de validare

date_identificare=detrend(id)
y_id=date_identificare.y;
u_id=date_identificare.u;

figure, plot(date_identificare) % grafic valori dupa aducere la medie zero

N=length(y_id); Ryu=zeros(1,N); Ru=zeros(1,N); M=2000;
for tau=1:N
    for k=1:N-tau
        Ryu(tau)=(y_id(tau-1+k)*u_id(k))+Ryu(tau);
        
        Ru(tau)=(u_id(tau-1+k)*u_id(k))+Ru(tau);
    end

    Ryu(tau)=Ryu(tau)/N;
    Ru(tau)=Ru(tau)/N;
end

k=Ru;
for j=1:length(k)
    placebo(j)=k(end-j+1);
end

Fi=k(1:M);
for i=1:length(k)-1    

    if i>M
        Fi=[Fi;[placebo((length(k)-i):end-(i-M)-1),k(1:M-i)]];
    else
        Fi=[Fi;[placebo((length(k)-i):end-1),k(1:M-i)]];
    end
end

Teta=Fi\Ryu';
yc_val=conv(val.u,Teta(1:100));
yc_val=yc_val(1:length(val.u));
MSE_VAL=0;
    for i=1:length(val.u)
        MSE_VAL=(val.y(i)-yc_val(i))^2+MSE_VAL;        
    end
    MSE_VAL=MSE_VAL/length(val.u),
figure, plot(yc_val,'r'), hold on
        plot(val.y, 'm')

figure, plot(Teta,'r'), hold on
        plot(imp, 'm')        
