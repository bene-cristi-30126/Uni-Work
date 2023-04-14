y=[1 32 54 21 56]; u=[-1 67 2 77];
na=5, nb=3;
Fi=zeros(1,na+nb); k_img=zeros(1,na+nb);
for i=2:length(y) 
    for j=1:na 
        if (i-j)<=0
            k_img(j)=0;
        else
            k_img(j)=-y(i-j)
        end
    end

    for j=1:nb 
        if (i-j)<=0
            k_img(j+na)=0;
        else
            k_img(j+na)=u(i-j)
        end
    end
    Fi=k_img';
    Fi=[Fi;k_img]  
end