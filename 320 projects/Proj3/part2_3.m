function part2_3()
    figure(1)
    X = randx(2,100000,0.5);
    sum_X = sum(X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1); 
    grid on;
    hold on;
    syms r;
    disp('Experimental Variance, Mean and Standard Deviation for N = 2:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n\n',std(sum_X));
    % Analytical Mean = N*2 Analytical Variance = N*4
    %N=2
    f_r = (1./(sqrt(2.*pi.*(8))).*(exp(-((r-4).^2)/(2.*(8)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Random Variable from p_x(x)=0.5e^{-0.5x} N=2');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(2)
    X = randx(10,100000,0.5);
    %disp(X);
    sum_X = sum(X);
    %disp(sum_X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1); 
    grid on;
    hold on;
    syms r;
    disp('Experimental Variance, Mean and Standard Deviation for N = 10:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n\n',std(sum_X));
    % Analytical Mean = N*2 Analytical Variance = N*4
    %N=10
    f_r = (1./(sqrt(2.*pi.*(40))).*(exp(-((r-20).^2)/(2.*(40)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Random Variable from p_x(x)=0.5e^{-0.5x} N=10');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(3)
    X = randx(100,100000,0.5);
    sum_X = sum(X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1); 
    grid on;
    hold on;
    syms r;
    disp('Experimental Variance, Mean and Standard Deviation for N = 100:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n',std(sum_X));
    % Analytical Mean = N*2 Analytical Variance = N*4
    %N=100
    f_r = (1./(sqrt(2.*pi.*(400))).*(exp(-((r-200).^2)/(2.*(400)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Random Variable from p_x(x)=0.5e^{-0.5x} N=100');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
end
function rexp = randx(n,k,lambda)
%
%function rexp = randx(n,k,lambda)
% Generates samples of an exponentially distributed random variable with
% parameter lambda.
% Calling parameters
%       n:    number of columns in output array rexp
%       m:    number of rows in output array rexp
%       lambda:  exponential distribution parameter, lambda > 0.
%  Returned parameters
%       rexp  an n x k array containing independent samples from an
%       exponential distribution with pdf f(x) = lambda exp( -lambda*x)
%
% Help comments updated 2/13/2021 EFCL
% Original code EFCL ~1989
%
Z = rand(n,k);  % compute a uniformly distributed random variable

% Now treating the Z value as the CDF of the desired exponential random variable,
% invert the CDF ( F(x) = 1 - exp(-lambda*x) ) to find the equivalent x
% value.  exp(-lambda x) = 1 - F(x) = 1 - Z
%         -lambda x = log(1 - Z)
%             x = -log(1-Z)/lambda

rexp=zeros(n,k);  % establish the memory
rexp=-log(1-Z)/lambda; % invert the CDF.
end