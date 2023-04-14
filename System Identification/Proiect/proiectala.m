clear all
x=[ones(4,1),3*ones(4,1), 2*ones(4,1), 5*ones(4,1), -2*ones(4,1), -5*ones(4,1)];
X_placebo=x;
prime=1;    mariX=size(x); marix=size(x); 
while mariX(1,2)>1


        for secon=prime:marix(1,2)-1
            if prime==1 & secon==1
                c=x(:,prime).*x(:,secon+1);
            else
                c=[c,x(:,prime).*x(:,secon+1)]
            end

        end
    
        X_placebo(:,1)=[]; mariX=size(X_placebo); prime=prime+1;

end