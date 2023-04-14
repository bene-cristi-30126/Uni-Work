 u = @(t) (t >=0);
 t = -1 : 0.01 : 8;
 
 %plot(t,dirac(t));


%filtre
% 
% A = [1 6 61; 11 112 15; 123 2 13];
% h = 1/9*[1 1 1; 1 1 1; 1 1 1];
% B = imfilter(A,h);
% imagesc(A);
% figure
% imagesc(B);


%exemplu colocviu-convolutie
%1)
% u = inline('n>=0','n');
% n = 0: 10;
% x = inline('cos(2*pi*n).*(u(-n+3) - u(n))','u','n');
% v = inline('0.5.^n.*u(n)','u','n');
% z = conv(double(x(u,n)), double(v(u,n)));
% subplot(3,1,1);
% stem(n,x(u,n),'r');
% subplot(3,1,2);
% stem(n,v(u,n),'g');
% subplot(3,1,3);
% stem(n,z(1:length(n)),'b');

%Serii Fourier
w0 = 2*pi;          %pulsatia
T0 = 2*pi/w0;       %perioada
Ts = 0.02;        %perioada de esantionare
t = -1 : Ts : 2;
nc = 10;            %numar de coeficienti
y = ones(size(t));  %%semnalul pe care-l reconstruim
nmax = floor(nc/2); %floor ia partea intreaga
Xm0 = [];           %termenul Ak din suma
ki0 = [];            %
y = -0.5;

for k =1 : nmax
    Xm = 1/(k);          %calculez coeficientii
    ki = pi/2*(-1)^k;       %calculez 
    y =  y + 2*Xm*cos(k*w0*t + ki);    %calculez semnalul 
    arm = 2*Xm*cos(k*w0*t + ki);            %calculez armonica
end

figure
%plotare semnal de iesire si armonica
subplot(2,1,1)
plot(t,y,'b');
subplot(2,1,2)
plot(t,arm,'*r');

figure
n = 1 : nmax;
n0 = [0 n];

%spectrul de amplitudine
subplot(3,1,1);
plot(0,-0.5,'*',n,Xm,'*');

%spectrul de faza 
subplot(3,1,2);
plot(n0,[ki0 ki],'*g');

%spectrul de putere
subplot(3,1,3);
plot(n0,[Xm0^2 (Xm.^2)/2],'*r');