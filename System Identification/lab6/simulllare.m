load("iddata-18.mat");

na=1;m=2; u=val.u, y=id.y

    for n=1:na
        for i=1:length(y)
            if i<=n
              coloane_y(i,n)=0; coloane_u(i,n)=0;
            else
              coloane_y(i,n)=y(i-n); coloane_u(i,n)=u(i-n);
            end
        end
    end
        Marime_u=size(coloane_u);       Marime_y=size(coloane_y);        Matri=ones(length(y),1);     %initializre Matri    

    for pow=1:m
        Matri=[Matri,coloane_y.^pow];   Matri=[Matri,coloane_u.^pow];       % aduagare u si y simpli     
    end
    
    Simple=[coloane_u,coloane_y]; Marime_s=size(Simple);
    placebo=Simple;
    prime=1;    Marime_p=size(Simple);

    while Marime_p(1,2)>1
            for secon=prime:Marime_p(1,2)-1
                if prime==1 & secon==1
                    Combinati=Simple(:,prime).*Simple(:,secon+1);
                else
                    Combinati=[Combinati,Simple(:,prime).*Simple(:,secon+1)];
                end
            end    
            placebo(:,1)=[]; Marime_p=size(placebo); prime=prime+1;
    end

    Marime_c=size(Combinati);

    %combinatile neliniare pana la ordinul 3
        for i=1:Marime_c(1,2)
            for j=1:Marime_s(1,2)
                if i==1 & j==1
                    Combinati2=Combinati(:,1).*Simple(:,1);
                else
                    Combinati2=[Combinati2, Combinati(:,i).*Simple(:,j)];
                end
            end
        end
        FinalCombinati=Combinati2;

      %combinatile neliniare de la ordinul 4 in sus
      Marime_c2=size(Combinati2);
      for ordin=4:m
            for i=1:Marime_c2(1,2)
                for j=1:Marime_s(1,2)
                    if i==1 & j==1
                        Combinati2=Combinati(:,1).*Simple(:,1);
                    else
                        Combinati2=[Combinati2, Combinati2(:,i).*Simple(:,j)];
                    end
                end
            end
            FinalCombinati=[FinalCombinati, Combinati2];
      end

                
                    if m==1
                        Fi=Matri;
                    elseif m==2
                        Fi=[Matri,Combinati];
                    else
                        Fi=[Matri,Combinati,FinalCombinati];
                    end
end