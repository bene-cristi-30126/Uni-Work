m=3; Matri=ones(4,1);
na=1; y=[-1*ones(4,1),-2*ones(4,1),-3*ones(4,1)]; 
      u=[ones(4,1),2*ones(4,1), 3*ones(4,1)];
erori1=ones(3,4);
erori2=ones(3,4);

for na = 1:3
    nb = na;
    n = na+nb;
    for m = 1:4
        clear P;        
        x=zeros(length(y),na+nb);
        [Y{1:1:n}] = ndgrid(0:m);
        Pi = reshape(cat(n+1,Y{:}),[],n);
        sumPi = sum(Pi,2);
        l = 1;
        for i = 1:length(sumPi)
            if(sumPi(i) <= m)
                P(:,l) = Pi(i,:);
                l = l + 1;
            end
        end
        P=P';
for k=1:length(y)
    x1=zeros(1,na);
    x2=zeros(1,nb);
    for i=1:na
        if(k>i)
            x1(i)=y(k-i);
            x2(i)=u(k-i);
        end
    end
    x(k,:)=[x1 x2];
end

phi=zeros(length(y),length(P));

% generare phi, yhat
for k=1:length(y)
    for i=1:length(P)
        phi(k,i)=prod(x(k,:).^P(i,:),"all");
    end
end

teta=phi\y;
yhat=phi*teta;

% figure,
% plot(yhat)
% hold on;
% plot(y);

MSE=0;
for i=1:length(yhat)
MSE=MSE+(y(i)-yhat(i))^2;
end
MEP2=MSE/length(yhat);
%title(MEP2);
erori1(na,m)=MEP2;

%simulare 

yhatnou=zeros(1,length(y));
xsim=zeros(length(y),na+nb);

for k=1:length(y)
    x1sim=zeros(1,na);
    x2sim=zeros(1,nb);
    for i=1:na
        if(k>i)
        x1sim(i)=yhatnou(k-i);
        x2sim(i)=u(k-i);
        end
    end
    xsim(k,:)=[x1sim x2sim];
    linie=xsim(k,:);
    w=[];
       
        for i=1:length(P)
            p=1;
            for j=1:na+nb
                p=p*linie(j).^P(i,j);
            end
            w(i)=p;
        end
        yhatnou(k)=w*teta;
end
yhatvector(b,:)=yhatnou;
b=b+1;
MSE=0;
for i=1:length(yhatnou)
MSE=MSE+(y(i)-yhatnou(i))^2;
end
MEP3=MSE/length(yhatnou);
%title(MEP2);
erori2(na,m)=MEP3;
    end
end