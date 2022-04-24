clear all;
clc;
close all;

x = 0:6;
y = [0 0.8415 0.9093 0.1411 -0.7568 -0.9589 -0.2794];

n = length(x);
d = zeros(n);

for i = 1:n
    d(i,1) = y(i);
end

% k-rows and j-column

for j = 2:n
    
    for k = j:n
        
        d(k,j) = ( d(k,j-1) - d(k-1,j-1) ) / ( x(k) - x(k-j+1));
        
    end
end

C = d(n,n);

for k=n-1:-1:1
    C = conv(C, poly(x(k)));
    m = length(C);
    C(m) = C(m) + d(k,k);
end
C
% plotting the generated polynomial function.
m = 0:0.1:6;
h = polyval(C,m);
plot(x,y,'o'), hold on;
plot(m,h); 
grid on;
