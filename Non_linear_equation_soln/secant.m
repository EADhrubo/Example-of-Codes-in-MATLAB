close all;
clear all;
clc;

xk = 0;
xkMinus1 = 1;
xTol= 1e-6;
maxiters = 1000;

iters = 1;

f = inline('3*x + sin(x) - exp(x)');
yk = f(xk);
ykMinus1 = f(xkMinus1);

root = (xkMinus1*yk - xk*ykMinus1)/(yk - ykMinus1);
ykPlus1 = f(root);

while(abs(root - xk))> xTol && iters<maxiters
    xkMinus1 = xk;
    ykMinus1 = yk;
    xk = root;
    yk = ykPlus1;
    root = (xkMinus1 * yk - xk * ykMinus1)/(yk - ykMinus1);
    ykPlus1 = f(root);
    iters = iters + 1;
end

root
ykPlus1
iters

    