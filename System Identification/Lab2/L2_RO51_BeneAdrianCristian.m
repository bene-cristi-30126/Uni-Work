load ('lab2_01.mat')
Np=length(id.X) %numar parametri
MSE_ID=zeros(1,25)
MSE_VAL=zeros(1,25)

plot(id.X,id.Y,'*g'), title('Forma functiei')

%Construitia sistemului de ecuatii liniare

for n=1:25
    Xsol=[ones(length(id.X),1)]
    for i=1:n-1
        Xsol=[Xsol, id.X'.^i]
    end
    Teta=Xsol\id.Y'
    
    Yc_id=zeros(1,Np);
    E_id=zeros(1,Np);
    for i=1:Np
        Yc_id(i)=Xsol(i,:)*Teta;
        E_id(i)=id.Y(i)-Yc_id(i);
    end

 %Calcul MSE pe datele de identificare

    for i=1:Np
        MSE_ID(n)=MSE_ID(n)+E_id(i).^2,
    end
    MSE_ID(n)=MSE_ID(n)/Np,
    
    N_val=length(val.X),
    Yc_val=zeros(1,N_val);
    E_val=zeros(1,N_val);
 
 %Calcul MSE pe datele de validare

    Xval=[ones(length(val.X),1)]
    for i=1:n-1
        Xval=[Xval, val.X'.^i]
    end

    for i=1:N_val
        Yc_val(i)=Xval(i,:)*Teta;
        E_val(i)=val.Y(i)-Yc_val(i);
    end

    for i=1:N_val
        MSE_VAL(n)=MSE_VAL(n)+E_val(i).^2,
    end
    MSE_VAL(n)=MSE_VAL(n)/N_val,
end

figure, plot(1:length(MSE_ID),MSE_ID, 'r', 1:length(MSE_VAL), MSE_VAL, 'g'), title('MSE cu MSE_VAL min pentru n=17')
figure, plot(id.X,id.Y,'*r', id.X,Yc_id'), title('Date identificare')
figure, plot(val.X,val.Y,'*r', val.X,Yc_val'), title('Date validare')