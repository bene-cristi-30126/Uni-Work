nc=327;
ax = [-3.7 -0.01 -4.8 -0.4 0.7 0.6 -44.2 141.6];
bx = [0.9 0.1 0.5 -0.2 -0.03 0.1 1.2 0];
ay = [-0.6 -0.3 0.6 0.2 0.1 -0.1 -1.2 121.3];
by = [-3.6 -0.6 3.7 0.4 0.1 0.8 -43.8 ];
X=c(1,:); Y=c(2,:);
m=length(X);
T=m; w=2*pi/T; tau=T/m;
%calculul coeficientilor seriei Fourier
ax=[]; bx=[];
for k=1:nc
    ax(k)=0; bx(k)=0;
    for i=1:m
        ax(k)=ax(k)+ X(i)*cos(k*w*i*tau);
        bx(k)= bx(k)+X(i)*sin(k*w*i*tau);
    end
end
ax=(2/m)*ax; bx=(2/m)*bx; ax0=2/m*sum(X); bx0=0;
ay=[]; by=[];
for k=1:nc
    ay(k)=0; by(k)=0;
    for i=1:m
        ay(k)=ay(k)+ Y(i)*cos(k*w*i*tau);
        by(k)=by(k)+ Y(i)*sin(k*w*i*tau);
    end
end
ay=(2/m)*ay; by=(2/m)*by; ay0=2/m*sum(Y); by0=0;

%reconstructia conturului pe baza coeficientilor Fourier
for n=1:m
    X2(n)=ax0/2;
    Y2(n)=ay0/2;
    for k=1:nc
        X2(n)=X2(n) + ax(k)*cos(k*w*n)+ bx(k)*sin(k*w*n);
        Y2(n)=Y2(n) + ay(k)*cos(k*w*n)+ by(k)*sin(k*w*n);
    end
end
c2=[X2;Y2];
figure, subplot(3,2,1), plot(c(1,:),c(2,:)); title('Conturul obiectului');
subplot(3,2,2),plot(c2(1,:),c2(2,:)); hold on; plot(ax0/2,ay0/2,'*'); title('Contur reconstruit');
subplot(3,2,3),bar(ax), title('a_x'), subplot(3,2,4), bar(bx) ,title('b_x');
subplot(3,2,5), bar(ay), title('a_y'), subplot(3,2,6), bar(by), title('b_y');