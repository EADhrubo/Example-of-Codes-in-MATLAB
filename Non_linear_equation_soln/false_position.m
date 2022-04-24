clear all;
clc;
close all;

xlow = -1;
xup = 0;
xtol = 1e-4;

f = inline('x^5 + x + 1');

iter = 0;
x0 = 0;
x = xup - (f(xup)*(xlow-xup)/(f(xlow)-f(xup)));
 
while (abs(x - x0)) > xtol
    
    if (f(x)*f(xlow)) > 0.0
    xlow = x;

    else
        xup = x;
    end
    
    x0 = x;
    x = xup - (f(xup)*(xlow-xup)/(f(xlow)-f(xup)));
    iter = iter + 1;

end

root = x
iter
        