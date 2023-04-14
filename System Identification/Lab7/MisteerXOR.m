

N=62; m=5; a=0.5;b=1;
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
    u(k)=x(m);
    u_intrare=a+(b-a)*u(k);

    xori=parametri(1)*x(1);
    for i=1:m-1
        xori=xor(xori,parametri(i+1)*x(i+1));
    end

    for i=2:m
        x_actual(i)=x(i-1);
    end
    x_actual(1)=xori;
    x=x_actual;
end
