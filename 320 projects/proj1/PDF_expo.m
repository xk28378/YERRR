function PDF_expo()
    %10 trials
    figure(1)
    list = randx(1,10,0.5);
    hist = histogram(list,'Normalization', 'pdf');
    hist.BinWidth = 2;
    hold on
    x = [0:1:10];
    y = 0.5 * exp(-0.5*x);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF of exponentially distributed random variable for 10 trials');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 10 trials = %0.4f\n',M);
    fprintf('Variance for 10 trials = %0.4f\n',V);
    
    %1000 trials
    figure(2)
    list = randx(1,1000,0.5);
    hist = histogram(list,'Normalization', 'pdf');
    hold on
    x = [0:1:10];
    y = 0.5 * exp(-0.5*x);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF of exponentially distributed random variable for 1,000 trials');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 1,000 trial s= %0.4f\n',M);
    fprintf('Variance for 1,000 trials = %0.4f\n',V);
    
    %100000 trials
    figure(3)
    list = randx(1,100000,0.5);
    hist = histogram(list,'Normalization', 'pdf');
    hold on
    x = [0:1:10];
    y = 0.5 * exp(-0.5*x);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF of exponentially distributed random variable for 100,000 trials');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 100,000 trials = %0.4f\n',M);
    fprintf('Variance for 100,000 trials = %0.4f\n',V);
    
    
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