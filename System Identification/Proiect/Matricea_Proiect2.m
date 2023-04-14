clear all, close all
load("iddata-18.mat");

m=2;        na=1; %n=na=nb


%Creare ARX
for i=1:m-1
    if i==1
        ARX=[zeros(1,)]

    for j=1:n
        for k=1:length(id.y)
            ARX=[ARX; 1, id.y(k-j)]     %id.y.^(i).*id.u, id.u.^(i+1), id.y.^(i+1)
        end
    end
end

arx2=ARX
% refacem decalat ARX
 for i=1:length(id.y)-1
     ARX(i+1,:)=arx2(i,:);
 end
 
     ARX(1,:)=zeros(1,size(ARX,2));

Teta=ARX\id.y;

ARX_val=[ones(length(val.y),1), val.u, val.y];

for i=1:m-1
    if i==1
        ARX_val=[ARX_val, val.y.^(i).*val.u, val.u.^(i+1), val.y.^(i+1)]
    else
        ARX_val=[ARX_val, val.y.^(i).*val.u,  val.u.^(i).*val.y, val.u.^(i+1), val.y.^(i+1), val.y.^(i-1).*val.u.^(i-1)]
    end
end


arx2val=ARX_val;
for i=1:length(val.y)-1
     ARX_val(i+1,:)=arx2val(i,:);
 end
 
     ARX_val(1,:)=zeros(1,size(ARX_val,2));

y_val=ARX*Teta;

plot(val.y, 'b'), hold on, plot(y_val, 'r')

    MSE=sum(y_val.^2-val.y.^2);
    MSE=MSE/length(val.y)


%     if i==1
%             ARX=[ARX, id.y.^(i).*id.u, id.u.^(i+1), id.y.^(i+1), ]
%         else
%             ARX=[ARX, id.y.^(i).*id.u,  id.u.^(i).*id.y, id.u.^(i+1), id.y.^(i+1), id.y.^(i).*id.u.^(i)]        
%     end