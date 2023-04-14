close all, clear all
load("lab10_5.mat")

subplot(211), plot(id)
subplot(212), plot(val)

na=3*n; nb=3*n; 
N=length(id.y);

Teta(:,1)=zeros(na+nb,1);
invP=100*eye(na+nb);

for k=2:N
        for j=1:na 
            if (k-j)<=0
                k_img(j)=0;
            else
                k_img(j)=-id.y(k-j);
            end
        end
    
        for j=1:nb 
            if (k-j)<=0
                k_img(j+na)=0;
            else
                k_img(j+na)=id.u(k-j);
            end
        end 
        Fi=k_img';

        eroare=id.y(k)-Fi'*Teta(:,k-1);
        invP2=invP- ( invP * Fi * Fi' * invP )/( 1+Fi' * invP * Fi);
        invP=invP2;
        W=invP*Fi;
        Teta(:,k)=Teta(:,k-1)+W*eroare;
end

Teta37=Teta(:,37);
UltimateTeta=Teta(:,length(id.y));
model=idpoly(   [1 UltimateTeta(1:na)'],    [0 UltimateTeta(na+1:na+nb)'],1,1,1,0,val.Ts);
model37=idpoly( [1 Teta37(1:na)'],          [0 Teta37(na+1:na+nb)'],1,1,1,0,val.Ts);

figure, compare(val,model,model37)