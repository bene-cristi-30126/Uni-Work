%Numarul de antrenori
na = 1;
%Numarul de canale
z = 6;
%Turatia
%numarul de ordine i
i = 3;
%turatia motorului de antrenare
ni = (75 + 5*i)*15;
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
L=0.3; %metri
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
w2max = w3*(lamda/(1-lamda))