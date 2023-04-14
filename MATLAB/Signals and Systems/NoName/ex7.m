%x(t)
subplot(311)
t=0:0.0001:0.2;
x=cos(2*pi*t/0.1-acos(0));
plot(t,x); grid(); xlabel('t'); ylabel('x(t)');

%y(t)
subplot(312)
t=0:0.0001:0.2;
y=cos(2*pi*t/0.1);
plot(t,y); grid(); xlabel('t'); ylabel('y(t)');

%z(t)
subplot(313)
t=0:0.0001:0.2;
z=cos(2*pi*t/0.1).*cos(2*pi*t/0.1-acos(0));
plot(t,z); grid(); xlabel('t'); ylabel('z(t)');