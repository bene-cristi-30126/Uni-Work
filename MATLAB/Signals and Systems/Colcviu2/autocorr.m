function phix=autocorr(x,N,M)
if((length(x)<M+N))
phix=[];
return
end
phix=zeros(1,N);
for n=1:N
for k=n+1:n+M
phix(n)=phix(n)+x(k)*x(k-n);
end
end
end