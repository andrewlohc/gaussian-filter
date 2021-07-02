function [output]=diffgaussian(input,s,v1,v2)
%% Example
%[output]=diffgaussian('MarilynAlbert.jpg',50,12,5);
%[output]=diffgaussian('Nature.jpg',50,12,11);
%[output]=diffgaussian('Carl_Friedrich_Gauss.jpg',50,12,11);
%[output]=diffgaussian('jennifer.jpg',50,12,11);

%% Algorithm
image=imread(input);
[row col]=size(input);
Mask1=fspecial('gaussian',s,v1);
Mask2=fspecial('gaussian',s,v2);
Mask=Mask1-Mask2;
bar3(Mask);
figure
output=200*imfilter(image,Mask,'replicate');
subplot(1,2,1);
imshow(image);
title('Input Image');
subplot(1,2,2);
imshow(output);
title(sprintf('Masked Size of %i',s)); 
end     