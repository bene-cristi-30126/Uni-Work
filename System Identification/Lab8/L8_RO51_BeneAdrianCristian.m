close all, clear all
load("lab8_3.mat")

subplot(211), plot(id)
subplot(212), plot(val)

N=length(id.y); u=id.u; y=id.y;
b=0; f=0; Teta(:,1)=[b;f];
l=1; alfa=0.06; l_max=150; delta=1e-5;

e=zeros(1,N); 
derivata_b=zeros(1,N); 
derivata_f=zeros(1,N);

while 1
    Gradi=0; Hessian=eye(2);
    for k=2:N
        e(k)=y(k)+f*y(k-1)-b*u(k-1)-f*e(k-1);
        
        derivata_b(k)=-u(k-1) - f*derivata_b(k-1);
        derivata_f(k)= y(k-1) - f*derivata_f(k-1) - e(k-1);
    end
        derivata_e=[derivata_b; derivata_f];
    
                Gradienti=e.*derivata_e;
                for i=1:N
                    Gradi=Gradienti(:,i)+Gradi;
                end
                Gradi=(2/N)*Gradi;

                for i=1:N
                    Hessieni=derivata_e(:,i)*derivata_e(:,i)';
                    Hessian=Hessieni+Hessian;
                end
                Hessian=(2/N).*Hessian;

    Teta(:,l+1)=Teta(:,l)-alfa*(Hessian^-1)*Gradi;    
    dif_Teta=Teta(:,l+1)-Teta(:,l);
    if norm(dif_Teta)<delta | l==l_max
        break
    else        
        b=Teta(1,l); f=Teta(2,l);
        l=l+1;
    end
end
MSE=sum(e.^2)/N

model=idpoly(1,[0 b],1,1,[1 f],id.Ts)
figure, compare(model,val)