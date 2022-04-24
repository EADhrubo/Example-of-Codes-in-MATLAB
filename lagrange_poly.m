clear all;
close all;
clc

x = [0 1 2 3 4 5 6];
y = [0  0.8415 0.9093 0.1411 -0.7568 -0.9589 -0.2794];
 
plot(x,y,'ko'), hold;
n=length(x);
 
sum = 0;
% generating Lagrange polynomial. 
for i=1:n
    p=1;
  
    for j=1:n
        if j~=i
            p=conv(p,(poly(x(j))/(x(i)-x(j)))); % generating each term.
        end
    end
    
    sum = sum + p * y(i); % adding the terms.
end

% plotting the Lagrange polynomial. 
m = 0:0.001:6;
h = polyval(sum,m);
plot(m,h), title('Lagrange Interpoation');
grid;
