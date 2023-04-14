%eliptici
%%descriptori eliptici
ax = [ -44.2 0.6 0.7 -0.4 -4.48 -0.01 -3.7];
bx = [ 1.2 0.1 -0.03 -0.2 0.5 0.1 0.9];
ay = [ -1.2 -0.1 0.1 0.2 0.6 -0.3 -0.6];
by = [ -43.8 0.8 0.1 0.4 3.7 -0. -3.6];
ax0 = 141.6;
ay0 = 121.3;
m = 1000;% preizia rezultatului
T = m; w = 2*pi/T;
for n = 1:m
X(n) = ax0/2;
Y(n) = ay0/2;
for k = 1:7
X(n) = X(n) + ax(k)*cos(k*w*n) + bx(k)*sin(k*w*n);
Y(n) = Y(n) + ay(k)*cos(k*w*n) + by(k)*sin(k*w*n);
end
end
C = [X;Y];
plot(C(1,:),C(2,:),'r'); hold on;
plot(0.5*ax0,0.5*ay0,'*');