clear all;
clc;
close all;

x1 = 0;
x2 = 2;
toler = 1e-10;

h(1) = x2-x1;
f = inline('X*exp(-2*X^2)');

s1 = (f(x2) + f(x1))/2;
I1 = h*s1;
I0 = 0;
act = 0.249916;
i = 1;
error(1) = abs(act - I1);
k = 1;

while abs(I1-I0) > toler
    
    x = x1 + h(k)/2;
    
    for j = 1:i
        s1 = s1 + f(x);
        x = x + h(k);
    end
    
    k = k + 1;
    i = 2*i;
    h(k) = h(k-1)/2;
    I0 = I1;
    I1 = h(k) * s1;
    error(k) = abs(act-I1);
end

integral = I1
iteration = k-1

semilogx(h,error), grid on;
