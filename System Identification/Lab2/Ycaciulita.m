n=5
Np=length(id.X)
Yc_id=zeros(1,Np);
E_id=zeros(1,Np);

for i=1:Np    
    Yc_id(i)=Xsol(i,:)*Teta;
    E_id(i)=id.Y(i)-Yc_id(i);
end

 plot(1:length(E_id),E_id), title('Eroare identificare')