function [output]=invgaussian(input,s)
%% Example
%[output]=invgaussian('Nature.jpg',20);
%% Algorithm
image=imread(input);
[row col]=size(input);
variance=(s-1)/6;
Mask=fspecial('gaussian',s,variance);
inverseMask= max(max(Mask))-Mask;
output=imfilter(image,inverseMask,'replicate');
subplot(1,2,1);
imshow(image);
title('Input Image');
subplot(1,2,2);
imshow(output);
title(sprintf('Masked Size of %i',s)); 
end     