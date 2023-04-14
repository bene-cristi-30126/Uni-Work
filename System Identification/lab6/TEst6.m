clear all,close all,
load('lab6_8.mat')

na=12; nb=13; N=length(id.y);
ARX_id=MatrixARX(id.u,id.y,na,nb);
Teta=ARX_id\id.y;

ARX_pre=MatrixARX(val.u,val.y,na,nb);
ypre=ARX_pre*Teta;

ysim=zeros(1,na+nb);
for i=2:length(ypre)
    for j=1:na
        if(i-j)<=0
            k_img(j)=0;
        else
            k_img(j)=-ysim(i-j);
        end
    end
    for j=1:nb
        if(i-j)<=0
            k_img(j+na)=0;
        else
            k_img(j+na)=val.u(i-j);
        end
    end
    ysim(i)=[k_img*Teta];
end

compare(val.y,ypre,ysim)

function fi=MatrixARX(intrare,iesire,na,nb)
fi=zeros(1,na+nb); k_img=zeros(1,na+nb);
for i=2:length(iesire)
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
    fi=[fi;k_img];
end
end