clear all;
close all;
clc;

h = 8^-1;
xlow = 0;
xup = 3;
n = (xup-xlow)/h;

f = inline('((x-y)/2)');
y(1) = 1;
x(1) = 0;
k = 1;

%while x(k) <= xup
for k = 1:n
    y(k+1) = y(k) + f(x(k),y(k)) * h;
    x(k+1) = x(k) + h;
    %k = k + 1;
end

yact = 3*exp(-x/2) - 2 + x;

plot(x,y,x,yact);