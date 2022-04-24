clear all;
clc;
close all;

x1 = 0;
x2 = 4;

f = inline('(X^2)*exp(-X)');

x = x1;

n = 3:3:600;

for k = 1 : length(n)
    h = (x2-x1)/n(k);
    sum = 0;
    
    for i = 1:3:n(k)-2
        sum = sum + f(x+(i-1)*h) + 3*f(x+i*h) + 3*f(x+(i+1)*h) + f(x+(i+2)*h);
    end

    integral(k) = (3*h/8) * sum;
end
integral(4)
plot(n,integral), grid on;