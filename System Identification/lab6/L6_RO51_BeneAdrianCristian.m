clear all, close all
load ('lab6_8.mat')

na=1:30; nb=1:30;
NN=struc(na,nb,1);
V=arxstruc(id,val,NN);
NN_ideal = selstruc(V,0); 
na=NN_ideal(1); nb=NN_ideal(2);

ARX_id = MatrixARX(id.u, id.y, na, nb)
Teta=ARX_id\id.y; 

%predictie
ARX_val= MatrixARX(val.u, val.y, na, nb)
Yp_val=ARX_val*Teta;

mse=val.y-Yp_val;
MSE_VAL=sum(mse.^2)/length(Yp_val);

   
 % simulare
k_img_sim=zeros(1,na+nb);
for i=1:length(Yp_val) 
    for j=1:na 
        if (i-j)<=0
            k_img_sim(j)=0;
        else
            k_img_sim(j)=-Yp_val(i-j);
        end
    end

    for j=1:nb 
        if (i-j)<=0
            k_img_sim(j+na)=0;
        else
            k_img_sim(j+na)=val.u(i-j);
        end
    end
    bau(i,:)=k_img_sim
    Ysim(i)=[k_img_sim*Teta];
end

Ysim=Ysim(1:length(val.u));
mse=val.y-Ysim;
MSE_VAL=sum(mse.^2)/length(Ysim);

figure, plot(Yp_val), hold on, plot(val.y), plot(Ysim, 'r')

function aru= MatrixARX(intrare,iesire,na,nb)
aru=zeros(1,na+nb); k_img=zeros(1,na+nb);
for i=2:length(intrare)
    for j=1:na
        if(i-j)<=0
            k_img(j)=0;
        else
            k_img(j)=-iesire(i-j);
        end
    end
    for j=1:nb
        if(i-j)<=0
            k_img(j+na)=0;
        else
            k_img(j+na)=intrare(i-j);
        end
    end
    aru=[aru;k_img];
end
end