bw=imread('text.png');
a=bw(32:45,88:98);
figure,imshow(bw), figure, imshow(a)

%calcul corelatie utilizand FFT
C=real(ifft2(fft2(bw).*fft2(rot90(a,2),256,256)));
figure,imshow(C,[])

%determinare poziti sablon
thresh = max(C(:))*90/100;
D=(C>thresh);

se=strel('disk',5); E=imdilate(D,se);
figure, imshow(E)