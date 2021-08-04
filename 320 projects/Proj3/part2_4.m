function part2_4()
    figure(1)
    X = (rand(4,100000)<=0.5);
    sum_X = sum(X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1); 
    grid on;
    hold on;
    syms r;
    disp('Experimental Variance, Mean and Standard Deviation for N = 4:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n\n',std(sum_X));
    %Analytical Mean = N*0.5 Analytical Variance = N*0.25
    %N=4
    f_r = (1./(sqrt(2.*pi.*(1))).*(exp(-((r-2).^2)/(2.*(1)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('Scaled PDF of Random Bernoulli Expirement N=4');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(2)
    [N,edges] = histcounts(sum_X, 'Normalization','pdf');
    edges = edges(2:end) - (edges(2)-edges(1))/2;
    
    grid on;
    
    r = [-1:0.1:6];
    f_r = (1./(sqrt(2.*pi.*(1))).*(exp(-((r-2).^2)/(2.*(1)))));
    plot(edges, N, 'LineWidth', 3);
    hold on;
    plot(r,f_r, 'LineWidth', 3);
    hold off;
    xlabel('r');
    ylabel('f(r)');
    title('Theoretical PDF of Random Bernoulli Experiment N=4');
    legend('Histogram','Gaussian Curve');
    figure(3)
    X = (rand(8,100000)<=0.5);
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
    disp('Experimental Variance, Mean and Standard Deviation for N = 8:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n\n',std(sum_X));
    %Analytical Mean = N*0.5 Analytical Variance = N*0.25
    %N=8
    f_r = (1./(sqrt(2.*pi.*(2))).*(exp(-((r-4).^2)/(2.*(2)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('Scaled PDF of Random Bernoulli Expirement N=8');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(4)
    [N,edges] = histcounts(sum_X, 'Normalization','pdf');
    edges = edges(2:end) - (edges(2)-edges(1))/2;
    
    grid on;
    
    r = [-1:0.1:12];
    f_r = (1./(sqrt(2.*pi.*(2))).*(exp(-((r-4).^2)/(2.*(2)))));
    plot(edges, N, 'LineWidth', 3);
    hold on;
    plot(r,f_r, 'LineWidth', 3);
    hold off;
    xlabel('r');
    ylabel('f(r)');
    title('Theoretical PDF of Random Bernoulli Experiment N=8');
    legend('Histogram','Gaussian Curve');
    figure(5)
    X = (rand(1000,100000)<=0.5);
    sum_X = sum(X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1); 
    grid on;
    hold on;
    syms r;
    disp('Experimental Variance, Mean and Standard Deviation for N = 1000:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n',std(sum_X));
    %Analytical Mean = N*0.5 Analytical Variance = N*0.25
    %N=1000
    f_r = (1./(sqrt(2.*pi.*(250))).*(exp(-((r-500).^2)/(2.*(250)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('Scaled PDF of Random Bernoulli Expirement N=1000');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(6)
    [N,edges] = histcounts(sum_X, 'Normalization','pdf');
    edges = edges(2:end) - (edges(2)-edges(1))/2;
    plot(edges, N, 'LineWidth', 3);
    grid on;
    hold on;
    syms r;
    f_r = (1./(sqrt(2.*pi.*(250))).*(exp(-((r-500).^2)/(2.*(250)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('Theoretical PDF of Random Bernoulli Experiment N=1000');
    legend('Histogram','Gaussian Curve');
end