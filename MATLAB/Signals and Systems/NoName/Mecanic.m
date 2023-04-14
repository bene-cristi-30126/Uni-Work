%1.Numarul de dinti
z1 = 12;
z2 = 28;
%2.Coeficientii de deplasare a profilurilor
x1 = 0.57;
x2 = 0.48;
%3.Modulul
m=3;
%4.Unghiul de angrenare
inv0 = 0.014904; %involut de alfa0
alfa0 = 20*pi/180; %20 de grade -> radiani
invalfa = inv0+(2*(x1+x2)*tan(alfa0))/(z1+z2)
% involut alfa = 0.0363
% alfa = 26.56667(grade)
alfa=25.56667*pi/180
%5.Coeficientul de modificare a distantei dintre axe
y = ((z1+z2)/2)*(cos(alfa0)/cos(alfa)-1)
%6.Distanta axiala
a = m*(z1+z2)*cos(alfa0)/(2*cos(alfa))
%7.Coeficientul de scurtare a inaltimii dintilor
psi = x1+x2-y
%8.Inaltimea dintilor
h = m*(2.25-psi)
%9.Diametrul cercurilor de divizare
d1 = m*z1
r1 = d1/2;
d2 = m*z2
r2 = d2/2; 
%10.Diametrul cercurilor de baza
db1 = m*z1*cos(alfa0)
rb1 = db1/2;
db2 = m*z2*cos(alfa0)
rb2 = db2/2;
%11.Diametrul cercurilor de rostogolire
dw1 = m*z1*cos(alfa0)/cos(alfa)
rw1 = dw1/2;
dw2 = m*z2*cos(alfa0)/cos(alfa)
rw2 = dw2/2;
%12.Diametrul cercurilor de cap
da1 = m*(z1+2+2*x1-2*psi)
ra1 = da1/2;
da2 = m*(z2+2+2*x2-2*psi)
ra2 = da2/2;
%13.Diametrul cercurilor de picior
df1 = m*(z1-2+2*x1-0.5)
rf1 = df1/2;
df2 = m*(z2-2+2*x2-0.5)
rf2 = df2/2;
%14.Arcele dintilor pe cercurile de divizare
s1 = pi*m/2 + 2*m*x1*tan(alfa0)
s2 = pi*m/2 + 2*m*x2*tan(alfa0)
%15.Gradul de acoperire
E = (sqrt(ra2^2 - rb2^2) + sqrt(ra1^2-rb1^2) - a*sin(alfa))/(pi*m*cos(alfa0))
%16.Corzile constante
sc1 = m*(pi/2 * cos(alfa0)^2 + x1*sin(2*alfa0))
sc2 = m*(pi/2 * cos(alfa0)^2 + x2*sin(2*alfa0))
%17.Inaltimea la coarda constanta
hc1 = m*(x1*(cos(alfa0)^2) + 1 - psi - pi/8 * sin(2*alfa))
hc2 = m*(x2*(cos(alfa0)^2) + 1 - psi - pi/8 * sin(2*alfa))
%18.Lungimile peste dinti
N1 = 3;
N2 = 9;
WN1 = m * ((N1-0.5)*pi+2*x1*tan(alfa0)+z1*inv0)*cos(alfa0)
WN2 = m * ((N2-0.5)*pi+2*x2*tan(alfa0)+z2*inv0)*cos(alfa0) 

lambda =0.5 ; w1=10*pi;

t = -2.5:0.01:2.5; 
%plot(t,atan( lambda*sin(t)/ 1-lambda*cos(t) )), xlabel('fi1'),ylabel('unghiul de rrotatie')
%grid on

%figure, plot(t,lambda*(cos(t)-lambda)*w1./(1-2*lambda*cos(t)+lambda^2)) ,xlabel('fi1'),ylabel('viteza unghiulara')
%grid on

%figure, plot(t,-lambda*(1-lambda^2)*sin(t)*w1^2./(1-2*lambda*cos(t)+lambda^2).^2 ) , xlabel('fi1'),ylabel('acceleratie unghiulara')
%grid on

figure, L=64; title('Relatii Aproximative')
t = 0:0.01:7; 
subplot(131), plot(t,L*(1/lambda-0.25*lambda+cos(t)+0.25*lambda*cos(2*t))), xlabel('fi1'),ylabel('unghiul de rrotatie')
grid on

subplot(132), plot(t,-L*w1*(sin(t) + 0.5*lambda*sin(2*t) )),xlabel('fi1'),ylabel('viteza unghiulara')
grid on

subplot(133), plot(t,-L*w1^2*(cos(t) + lambda*cos(2*t) )),xlabel('fi1'),ylabel('accceleratia unghiulara')
grid on




%Numarul de antrenori
na = 1;
%Numarul de canale
z = 6;
%Turatia
%numarul de ordine i
i = 3;
%turatia motorului de antrenare
ni = (75 + 5*i)*15
% n1/n2 = w1/w2 = -z2/z1
% turatia motorului (ni) este egala cu n1
n1=ni;
n2 = n1*z1/z2;
% n3 = turatia antrenorului
n3=n2;
% 1.Viteza unghiulara a elementului conducator
w3 = pi*n2/30
% 2.Constanta mecanismului
lamda = sin(pi/z)
% 3.Lungimea bratului de antrenare (R1<L)
L=0.1; %metri
R1=L*sin(pi/z)
% 4.Timpul de miscare in care elementul conducator antreneaza elementul 
tm = 2*pi*(1/2-1/z)/w3
% 5.Timpul de repaus al elementului condus
tr = 2*pi*(1/2 + 1/z)/w3
%6.Timpul de rotatie completa a elementului conducator
T = tm+tr
% 7.Coeficientul de miscare
km = 1/2 - 1/z
% 8.Coeficientul de repaus
kr = 1/2 + 1/z
% 9.Coeficientul timpului de lucru al mecanismului k
k = (z-2)/(z+2)
% 10.Viteza unghiulara maxima a