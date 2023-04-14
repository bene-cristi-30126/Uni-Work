clear all, close all
load("lab10_5.mat")

na=3*n;nb=3*n; N=length(id.y);

Teta(:,1)=zeros(na+nb,1);
P=100*eye(na+nb);

for k=2:N
    for j=1:na
        if(k-j)<=0
            k_img(j)=0;
        else
            k_img(j)=-id.y(k-j);
        end
    end
    for j=1:nb
        if(k-j)<=0
            k_img(j+na)=0;
        else
            k_img(j+na)=id.u(k-j);
        end
    end
    Fi=k_img';

    eroare=id.y(k)-Fi'*Teta(:,k-1);
    P2=P-(P*Fi*Fi'*P)/(1+Fi'*P*Fi);
    P=P2; 
    W=P*Fi;
    Teta(:,k)=Teta(:,k-1)+W*eroare;
end
UltimateTeta=Teta(:,N);
A=[1 UltimateTeta(1:na)']; B=[0 UltimateTeta(na+1:na+nb)'];
model=idpoly(A,B,1,1,1,0,val.Ts);
compare(model,val)