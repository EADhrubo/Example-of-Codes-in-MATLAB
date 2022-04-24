clear all;
clc;

x=[0 1 2 3 4 5];
y=[0.5 0.71 1.01 1.43 2.03 2.88];

n= length(x);
sumx=0;
sumsqrx=0;
sumcubex=0;
sumfourx=0;
sumy=0;
sumxy=0;
sumsqrxy=0;


for i=1:n
    
    %finding the summations
    sumx=sumx+x(i);
    sumsqrx=sumsqrx+x(i)*x(i);
    sumcubex=sumcubex+(x(i))^3;
    sumfourx=sumfourx+(x(i))^4;
    sumy=sumy+y(i);
    sumxy=sumxy+x(i)*y(i);
    sumsqrxy=sumsqrxy+(x(i))^2*y(i);
    
end

%Matrices for finding solution
A=[n sumx sumsqrx; sumx sumsqrx sumcubex; sumsqrx sumcubex sumfourx];
b=[sumy sumxy sumsqrxy]';

solution=inv(A)*b;
A0=solution(1);
A1=solution(2);
A2=solution(3);

%Here a2=A0 A1=a2*b2 and A2=a2*(b2)^2/2
disp('Value of a2:');
a2=A0
disp('Value of b2 calculated from A0 and A1:');
b2=A1/a2
disp('Value of b2 calculated from A0 and A1:');
b22=2*A2/A1

%Equation to be plotted
ym = a2*exp(b2.*x);
ym2 = a2*exp(b22.*x);

%plotting the result
subplot(2,1,1),plot(x,y,'o'), hold on, grid on;
subplot(2,1,1),plot(x,ym), title('Part 2 when b2=b2');
subplot(2,1,2),plot(x,y,'o'), hold on, grid on;
subplot(2,1,2),plot(x,ym2), title('Part 2 when b2=b22');


%Calculation of error
ym2 = a2*exp(b22.*x);
errorb2=0;
errorb22=0;

for j=1:n
    errorb2 = errorb2 + (y(j)-ym(j))^2;
    errorb22 = errorb22 + (y(j)-ym2(j))^2;
end

disp('error found from eqn. when b2=b2');
errorb2
disp('error found from eqn. when b2=b22');
errorb22
