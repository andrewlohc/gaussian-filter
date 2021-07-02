function [output]=gaussian(input,s,padding)
%% Example
%[output]=gaussian('MarilynAlbert.jpg',1000,'duplication');
%[output]=gaussian('Nature.jpg',50,'duplication');
%[output]=gaussian('house.jpg',50,'duplication');
%% Algorithm
image=imread(input);
[row col]=size(input);
variance=(s-1)/6;
switch padding
    case 'zero'
        Mask=fspecial('gaussian',s,variance);
        output=imfilter(image,Mask);
        subplot(1,1,1);
        imshow(image);
        title('Input Image');
        subplot(1,1,2);
        imshow(output);
        title(sprintf('Masked Size of %i',s));
    case 'duplication'
        Mask=fspecial('gaussian',s,variance);
        output=imfilter(image,Mask,'replicate');
        subplot(1,2,1);
        imshow(image);
        title('Input Image');
        subplot(1,2,2);
        imshow(output);
        title(sprintf('Masked Size of %i',s)); 
    otherwise
        warning('Error! Enter zero or duplication only.');
end
end     