load('product_14 (3).mat')
close all,
p=12, MAX=2, MSE_id=zeros(1,MAX), MSE_val=zeros(1,MAX);

k=y';
ndata = size(k, 2); 
procent = 82;
newpoints = floor(ndata*procent/100);

k = k(:);
yc = k(1:newpoints); 
yval=k(length(yc):length(y))

for m=1:MAX  
    fi_id=[ones(length(time(1:length(yc))),1), time(1:length(yc)), time(1:length(yc)).^3];
    fi_val=[ones(length(time(length(yc):length(y))),1), time(length(yc):length(y)) , time(length(yc):length(y)).^3];

    for i=1:m
        fi_id=[fi_id,cos(2*pi*i*time(1:length(yc))/p), sin(2*pi*i*time(1:length(yc))/p)];
    end
        Teta=fi_id\y(1:length(yc));
        yc=fi_id*Teta;
        E_id=y(1:length(yc))-yc;
    
    for i=1:length(yc)
        MSE_id(m)=MSE_id(m)+E_id(i).^2;
    end   
    

    for i=1:m
        fi_val=[fi_val,cos(2*pi*i*time(length(yc):length(y))/p), sin(2*pi*i*time(length(yc):length(y))/p)];
    end
        yval=fi_val*Teta;
        E_val=y(length(yc):length(y))-yval;

    for i=1:length(yval)
        MSE_val(m)=MSE_val(m)+E_val(i).^2;
    end   
    
    subplot(MAX,1,m), plot(time,y,'r', 1:length(yc),yc, 'g',  time(newpoints:length(y)),yval, 'b')
    
    m, MSE_id(m)=MSE_id(m)/length(E_id), MSE_val(m)=MSE_val(m)/length(E_val)
end    

figure, plot((1:MAX),MSE_id, 'm', (1:MAX), MSE_val, 'b'), legend('Identificare', 'Validare')