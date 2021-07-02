%% ELE888 Intelligent Systems Pre-Lab: Plotting Gaussian Distributions
%Student Name: Andrew Lo
%Student ID: 500 347 541
%Date: 2013/1/21
%Due: 2013/1/29 - 1:00 AM
%Variables: mu = mean, va = variance, x1,x2 = x-axis boundaries, 
%lc=legend counter

% Example script using gaussplot
% gaussplot(0,0.5,-5,5,'b',1);
% gaussplot(0,0.4,-5,5,'r',2);
% gaussplot(1,4.0,-5,5,'g',3);
% gaussplot(-2,0.9,-5,5,'k',4);grid;

function gaussplot(mu,va,x1,x2,color,lc)
sd=sqrt(va); %Standard deviation
x=[x1:0.01:x2]; %Create points for x-axis
y = 1./(sd.*sqrt(2*pi)).*exp(-0.5*((x-mu)/sd).^2); %Gaussian Equation
plot (x,y,color,'DisplayName',['\mu' num2str(lc) ' = ' num2str(mu) ', \sigma' num2str(lc) '^2 = ' num2str(va)]);
legend('-DynamicLegend');
xlabel('x');
ylabel('\phi (x)');
title('Gaussian Distributions');
hold on;
end
