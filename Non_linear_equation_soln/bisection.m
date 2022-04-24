clear all;
clc;
close all;

xlow = - 1;
xup = 0;
xtol = 1e-4;
xmid = (xlow + xup)/2;

f = inline('x^5 + x + 1');

ymid = f(xmid);
ylow = f(xlow);
iter = 0;

while ((xup - xlow)/2) > xtol
    iter = iter + 1;
    
    if((ylow * ymid) > 0.0)
        xlow = xmid;
    else
        xup = xmid;
    end
    
    xmid = (xlow + xup)/2 ;
    ymid = f(xmid);
    %% ylow = f(xlow);
end

root = xmid
ymid
iter


