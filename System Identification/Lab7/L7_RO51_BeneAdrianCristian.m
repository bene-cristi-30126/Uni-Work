clear all, close all
load ('uval.mat')
data_validare = system_simulator(3,u);

u_intrare=SPAB(300,3,0.5,1);
id = system_simulator(3,u_intrare');

model=arx(id, [15,15,1]);
figure, compare(model,data_validare)


function u_intrare= SPAB(N,m,a,b)
    x=ones(1,m); parametri=zeros(1,m); u=zeros(1,N); x_actual=zeros(1,m);
    if m==3
        parametri(1)=1; parametri(3)=1;
    elseif m==4
        parametri(1)=1; parametri(4)=1;
    elseif m==5
        parametri(2)=1; parametri(5)=1;
    elseif m==6
        parametri(1)=1; parametri(6)=1;
    elseif m==7
        parametri(1)=1; parametri(7)=1;
    elseif m==8
        parametri(1)=1; parametri(2)=1; parametri(7)=1; parametri(8)=1;
    elseif m==9
        parametri(4)=1; parametri(9)=1;
    elseif m==10
        parametri(3)=1, parametri(10)=1
    end
    
    for k=1:N
        u(k)=x(m); %luam ultimu termen
        u_intrare(k)=a+(b-a)*u(k); %scalare
    
        xori=parametri(1)*x(1); % formare primu xor
        for i=1:m-1
            xori=xor(xori,parametri(i+1)*x(i+1)); %ciorba de xori
        end
    
        for i=2:m
            x_actual(i)=x(i-1); % mutam in noul set de stari
        end
        x_actual(1)=xori; %actualizare primu termen 
        x=x_actual; % reconstruire x
    end

end