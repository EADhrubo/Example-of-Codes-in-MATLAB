clear all;
clc;
close all;

x = [1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0 3.2 3.4 3.6 3.8];
fx = [4.953 6.05 7.389 9.025 11.023 13.468 16.445 20.086 24.533 29.964 36.598 44.701];
% No. of subintervals
n = length(x)-1;

act = 39.748152;
sum = (fx(1) + fx(n+1))/2;

for j = 2 : n
    sum = sum + fx(j);
end
% For h = 0.2
h = 0.2;
integral = h * sum;
error = abs(act - integral);

fprintf('Actual Result = 39.748152\n');
fprintf('\nFor h = 0.2 calculated result = %f', integral);
fprintf('\nFor h = 0.2 error calculated = %f', error);

% For h = 0.4
h = 0.4;
integral = h * sum;
error = abs(act - integral);
fprintf('\nFor h = 0.4 calculated result = %f', integral);
fprintf('\nFor h = 0.4 error calculated = %f', error);

% For h = 0.6
h = 0.6;
integral = h * sum;
error = abs(act - integral);

fprintf('\nFor h = 0.6 calculated result = %f', integral);
fprintf('\nFor h = 0.6 error calculated = %f', error);

