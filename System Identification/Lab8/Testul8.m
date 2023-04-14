clear all, close all
load ('lab8_3.mat')

na=3*n; nb=3*n; N=length(id.y); y=id.y; u=id.u;

b=0;f=0; Teta(:,1)=[b;f];
delta=1e-5;alfa=0.05;l=1;l_max=150;
e=zeros(1,N);
derivata_b=zeros(1,N);
derivata_f=zeros(1,N);

while 1
    Gradi=[0;0]; Hessian=eye(2);
    for k=2:N
        e(k)=y(k)+f*y(k-1)-b*u(k-1)-f*e(k-1);
        derivata_b(k)=-u(k-1)-f*derivata_b(k-1);
        derivata_f(k)=y(k-1)-f*derivata_f(k-1)-e(k-1);
    end
    derivata_e=[derivata_b;derivata_f];
    V=e.*derivata_e;

    for i=1:N
        Gradi=V(:,i)+Gradi;
        Hessieni=derivata_e(:,i)*derivata_e(:,i)';
        Hessian=Hessieni+Hessian;
    end
    Gradi=(2/N)*Gradi;
    Hessian=(2/N).*Hessian;

    Teta(:,l+1)=Teta(:,l)-alfa*(Hessian^-1)*Gradi;
    dif_Teta=Teta(:,l+1)-Teta(:,l);

    if norm(dif_Teta)< delta | l==l_max
        break
    else
        b=Teta(1,l); f=Teta(2,l);
        l=l+1;
    end
end
MSE=sum(e.^2)/N;
model=idpoly(1,[0 b],1,1,[1 f],0,val.Ts)
compare(model,val)
