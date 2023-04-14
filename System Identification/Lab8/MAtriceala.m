close all, clear all
load("lab8_3.mat")


subplot(211), plot(id)
subplot(212), plot(val)

N=length(id.y);
b=0; f=0; Teta(:,1)=[b;f];
l=1; alfa=0.00001; l_max=100;  Gradi=0; Hessian=eye(2);

e=zeros(1,N); 
derivata_b=zeros(1,N); 
derivata_f=zeros(1,N);

%while 1
    for k=2:N
        e(k)=id.y(k)+f*id.y(k-1)-b*id.u(k-1)-f*e(k-1);
        
        derivata_b(k)=-id.u(k-1) - f*derivata_b(k-1);
        derivata_f(k)= id.y(k-1) - f*derivata_f(k-1) - e(k-1);
    end
        derivata_e=[derivata_b; derivata_f];
    
                Gradienti=e.*derivata_e;
                for ki=1:N
                    Gradi=Gradienti(:,ki)+Gradi;
                end
                Gradi=(2/N)*Gradi;

                for kh=1:N
                    Hessieni=derivata_e(:,kh)*derivata_e(:,kh)';
                    Hessian=Hessieni+Hessian;
                end
                Hessian=(2/N).*Hessian;

    Teta(:,l+1)=Teta(:,l)-alfa*(Hessian^-1)*Gradi;
    
%     if Teta(:,l+1)-Teta(:,l)<alfa | l==l_max
%         break
%     else        
%         b=Teta(1,l); f=Teta(2,l);
%         l=l+1;
%     end
% end
