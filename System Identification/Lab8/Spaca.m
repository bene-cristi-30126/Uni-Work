close all, clear all
load("lab8_3.mat")

N=length(id.y);
b=0; f=0; Teta(:,1)=[0.5;0.5];
l=1; alfa=0.00001; l_max=1000;  Gradi=0; Hessian=eye(2);

e=zeros(1,N); 
derivata_b=0; 
derivata_f=0;


for k=2:N
        e(k)=id.y(k)+f*id.y(k-1)-b*id.u(k-1)-f*e(k-1);
        
        derivata_b(k)=-id.u(k-1) - f*derivata_b(k-1);
        derivata_f(k)= id.y(k-1) - f*derivata_f(k-1) - e(k-1);
    end