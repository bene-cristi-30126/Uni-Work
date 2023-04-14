clear all, close all
load ('uval.mat')

data_validare=system_simulator(4,u);

u_intrare=SPAB(300,9,0.5,1);

id = system_simulator(4,u_intrare');

model=arx(id, [15,15,1]);
compare(model,data_validare)

function u_intrare=SPAB(N,m,a,b)
x=ones(1,m); para=zeros(1,m); x_actual=zeros(1,m); u=zeros(1,N);
if m==3
    para(1)=1; para(3)=1;
elseif m==4
    para(1)=1; para(4)=1;
    elseif m==5
    para(2)=1; para(5)=1;
    elseif m==6
    para(1)=1; para(6)=1;
    elseif m==7
    para(1)=1; para(7)=1;
    elseif m==8
    para(1)=1; para(2)=1; para(7)=1; para(8)=1;
    elseif m==9
    para(9)=1; para(4)=1;
    elseif m==10
    para(10)=1; para(3)=1;
end
for k=2:N
    u(k)=x(m);
    u_intrare(k)=a+(b-a)*u(k);
    xori=para(1)*x(1);

    for i=1:m-1
        xori=xor(xori,para(i+1)*x(i+1));
    end
    for i=2:m
        x_actual(i)=x(i-1);
    end
    x_actual(1)=xori;
    x=x_actual;
end
end
