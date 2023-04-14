time=1:1:109;
fi=[ones(length(time),1), time']
m=8, p=12;
for i=1:m
    fi=[fi,cos(2*pi*i*time'/p), sin(2*pi*i*time'/p)]
end