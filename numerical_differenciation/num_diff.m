clear all;
clc;

% Finding functional value of first derivative
x = 1 / sqrt(2);
h = 1;
toler = 10^-10;
error = 0;
it = 0;



for i = 1:2
    D(i) = ( -f(x+2*h) + 8 * f(x+h) - 8 * f(x-h) + f(x-2*h) ) / (12*h);
    error(i) = abs((1/x^2) * cos(cos(1/x)) * sin(1/x) - D(i));
    H(i) = h;
    h= h / 10;
    %H(i+1) = h;
    it = it + 1;
end

relerr = abs( D(i) - D(i-1) );

j = i + 1;

while relerr > toler
    
    D(i-1) = D(i);
    D(i) = ( -f(x+2*h) + 8 * f(x+h) - 8 * f(x-h) + f(x-2*h) ) / (12*h);
    
    error(j) = abs((1/x^2) * cos(cos(1/x)) * sin(1/x) - D(i));
    relerr = abs( D(i) - D(i-1) );
    
    H(j) = h;
    h= h / 10;
    j = j + 1;
    it = it + 1;

end

h = h * 10;

disp('Funtional Value of Derivative  = ');
D(i)

% Plot of Error Vs h
plot(H,error), title(' Error Vs h Curve' );


% Plot for functional value  of derivative when x is varied

x = 1 :0.5: 10

for i = 1 : length(x)
    yreal(i) = (1/x(i)^2) * cos(cos(1/x(i))) * sin(1/x(i));
end

for i = 1 : length(x)
    ycal(i) = ( -f(x(i)+2*h) + 8 * f(x(i)+h) - 8 * f(x(i)-h) + f(x(i)-2*h) ) / (12*h);
end

figure
plot(x ,yreal), hold on, title('functional value  of derivative when x is varied');
plot(x, ycal);