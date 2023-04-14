k=[1 -10 6 7 4 2 -12 42]; M=6
for j=1:length(k)
    placebo(j)=k(end-j+1);
end

Fi=k(1:M);
for i=1:length(k)-1    

    if i>M
        Fi=[Fi;[placebo((length(k)-i):end-(i-M)-1),k(1:M-i)]];
    else
        Fi=[Fi;[placebo((length(k)-i):end-1),k(1:M-i)]];
    end
end