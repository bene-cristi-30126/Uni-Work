function H = imfreqfilter(type,M, N, D0, n)
u=0:(M-1); v=0:(N-1); [V,U]= meshgrid(v,u);
D=sqrt((U-M/2).^2+(V-N/2).^2);
switch type
    case 'LPF'
        H=double(D<=D0); %lowpass filter
    case 'BLPF'
        H=1./(1+(D./D0).^(2*n)); %Butterworth lowpass filter
    case 'GLPF'
        H=exp((-D.^2)/(2*D0.^2)); %Gaussian lowpass filter
    case 'HPF'
        H=double(D>D0); %highpass filter
    case 'BHPF'
        H=1./(1+(D./D0).^(2*n)); %Butterworth lowpass filter
    case 'GHPF'
        H=1-exp((-D.^2)/(2*D0.^2)); %Gaussian lowpass filter
    end 
end

