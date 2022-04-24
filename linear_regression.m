clear all;
clc;

x=[0 1 2 3 4 5];
y=[0.5 0.71 1.01 1.43 2.03 2.88];

%linearization of non-linear equation
n=length(x);
Y=log(y);

sumx=0;
sumy=0;
sumxy=0;
sumxsq=0;
 
for i=1:n
    sumx=sumx+x(i);
    sumy=sumy+Y(i);
    sumxy=sumxy+x(i)*Y(i);
    sumxsq=sumxsq+x(i)^2;
end

%Let the co-efficient of x be a1 and intercept of Y-axis be a0 
a1=(n*sumxy-sumx*sumy)/(n*sumxsq-sumx^2);
a0=sumy/n-a1*sumx/n;

% But according to the given problem a0=log(a2) and a1=b2
a2=exp(a0)
b2=a1

% Equation to be plotted
ym=a2*exp(b2.*x);

plot(x,y,'o'), grid on, hold on, title('Lab Work - Part 1');
plot(x,ym);

% Calculation of error
error=0;
for j=1:n
    error = error + (y(j)-ym(j))^2;
end

error