 function [output] = gauss2d(N,std,type)
%%    Example
%  gauss=gauss2d(9,3)
%%    Algorithm
  [x y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
  f=1-exp(-x.^2/(2*std^2)-y.^2/(2*std^2));
  bar3(f);
  grid;
  output=f;
 end
