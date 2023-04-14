    function ARX_sim=Zeta(intrare,iesire,na,nb)
    ARX_sim=zeros(1,na+nb), k_img=zeros(1,na+nb)
    for i=2:length(iesire)
        for j=1:na
            if(i-j)<=0
                k_img(j)=0
            else
                k_img(j)=-iesire(i-j)
            end
        end
        for j=1:nb
            if(i-j)<=0
                k_img(j+na)=0
            else
                k_img(j+na)=intrare(i-j)
            end
        end
        ARX_sim=[ARX_sim; k_img]
    end
end

