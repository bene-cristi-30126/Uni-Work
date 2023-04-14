k=[1 -10 6 7]
Fi=k;
for j=1:length(k)
    k_invers=[k(length(k)), k], k(end)=[]
    Fi=[Fi;k]
end