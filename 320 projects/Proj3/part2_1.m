function part2_1()
    figure(1)
    X = rand(2,100000);
    sum_X = sum(X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(std1); 
    grid on;
    hold on;
    disp('Experimental Variance, Mean and Standard Deviation for N = 2:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n\n',std(sum_X));
    r = [-1:0.1:3];
    % Analytical Mean = N*0.5 Analytical Variance = N*1/12
    %N=2
    f_r = (1/(sqrt(2*pi*(1/6)))*(exp(-((r-(2*0.5)).^2)/(2*(1/6)))));
    plot(r,f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Random Variable from U(0,1) N=2');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(2)
    X = rand(6,100000);
    sum_X = sum(X);
    histogram(sum_X,'Normalization','pdf');
    mean_X = mean(sum_X);
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1);
    grid on;
    hold on;
    disp('Experimental Variance, Mean and Standard Deviation for N = 6:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n\n',std(sum_X));
    r = [-1:0.1:6];
    % Analytical Mean = N*0.5 Analytical Variance = N*1/12
    %N=6
    f_r = (1/(sqrt(2*pi*(1/2)))*(exp(-((r-3).^2)/(2*(1/2)))));
    plot(r,f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Random Variable from U(0,1) N=6');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(3)
    X = rand(12,100000);
    sum_X = sum(X);
    histogram(sum_X,'Normalization','pdf');
    mean_X = mean(sum_X);
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1);
    grid on;
    hold on;
    disp('Experimental Variance, Mean and Standard Deviation for N = 12:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n',std(sum_X));
    r = [-1:0.1:12];
    % Analytical Mean = N*0.5 Analytical Variance = N*1/12
    %N=12
    f_r = (1/(sqrt(2*pi*(1)))*(exp(-((r-6).^2)/(2*(1)))));
    plot(r,f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Random Variable from U(0,1) N=12');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
end