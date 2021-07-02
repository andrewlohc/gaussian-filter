function [output] = fgaussian(image,filtertype,D0)
%% Example
% fgaussian('MarilynAlbert.jpg','gaussian');
% fgaussian('MarilynAlbert.jpg','invgaussian');
%% Algorithm
input=double(imread(image));
[M N]=size(input);
P=2*M; %Used for padding
Q=2*N; %Used for padding
imagepad=zeros(P,Q);
for i=1:M    
    for j=1:N
        imagepad(i,j)=input(i,j);
    end
end

imageFFT=fft2(imagepad);  %Fast Fouriour Transform
imageFFT=fftshift(imageFFT); %Fast fourier shift

distance=zeros(M,N); %Compute distance calculation
for i=1:M    
        for j=1:N
            distance(i,j)=sqrt((i-1)^2+(j-1)^2);
        end
end

%Mirror distance metric to all 4 quadrants
a=flipdim(distance,1);
b=flipdim(a,2);
c=flipdim(b,1);
b=horzcat(b,a);
distance=horzcat(c,distance);
distance=vertcat(b,distance); %Euclidean Distance

GaussianFilter=exp(-(distance.^2)./(2.*(D0.^2)));

if strcmp(filtertype, 'gaussian')==1
    filtered=imageFFT.*GaussianFilter;     %Filter image F(u,v)H(u,v)
    filtered_padded=ifft2(ifftshift(filtered));%Inverse shift and transform
    output=zeros(M,N);%crop filtered image from padding
    for i=1:M    
         for j=1:N
             output(i,j)=filtered_padded(i,j);
         end
    end
    figure;
    imshow(output,[]);
    title('Output Image')
    output=uint8(output);
end

if strcmp(filtertype, 'invgaussian')==1
    filtered=imageFFT.*(1-GaussianFilter);     %Filter image F(u,v)H(u,v)
    filtered_padded=ifft2(ifftshift(filtered));%Inverse shift and transform
    output=zeros(M,N);%crop filtered image from padding
    for i=1:M    
         for j=1:N
             output(i,j)=filtered_padded(i,j);
         end
    end
    figure;
    imshow(output,[]);
    title('Output Image')
    output=uint8(output);
end
end
