T0=1; w0=2*pi/T0;
Ts=0.001; t=-1:Ts:2;
x=t-0.1-round(t);
plot(t,x)

N=20;
ak=fsAnalysis(x,t,T0,Ts,N);

% Exemplu 3
a0= ak(N+1);
ksi0= 0; 
Ak= abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

x_est= a0*ones(size(t));
for k=1:N
    x_est= x_est +2*Ak(k)*cos(w0*k*t+ksi(k));
end
figure; plot(t,x,'b',t,x_est,'r')
xlabel('t'); legend('x(t)', 'x_{est}(t)');

n0=0:N;
figure, subplot(311); stem(n0,[a0,Ak], '.')
legend('Amplitude spectrum')

subplot(312), stem(n0,[ksi0, ksi], '.g')
legend('Phase spectrum')

subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r')
xlabel('n'), legend('Pwoer spectrum')