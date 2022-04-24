clear all;
clc;
close all;

format long

x0 = -5;
toler = 1e-8;

f = inline('exp(-x)-1');
fd = inline('-exp(-x)');

dx = - f(x0) / fd(x0);

root = x0 + dx;

iter = 1;

while abs(dx) > toler
    
    dx = - f(root) / fd(root);
    root = root + dx;
    iter = iter + 1;
    
end

root
iter
    