function part2_2()
    figure(1)
    X = randi(8,2,100000);
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
    % Analytical Mean = N*4.5 Analytical Variance = N*5.25
    %N=2
    f_r = (1./(sqrt(2.*pi.*(10.5))).*(exp(-((r-9).^2)/(2.*(10.5)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Discrete Variable from U(0,1) N=2');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(2)
    X = randi(8,10,100000);
    %disp(X);
    sum_X = sum(X);
    %disp(sum_X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf', 'BinWidth',1);
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
    % Analytical Mean = N*4.5 Analytical Variance = N*5.25
    %N=10
    f_r = (1./(sqrt(2.*pi.*(52.5))).*(exp(-((r-45).^2)/(2.*(52.5)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Discrete Variable from U(0,1) N=10');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
    figure(3)
    X = randi(8,50,100000);
    sum_X = sum(X);
    mean_X = mean(sum_X);
    histogram(sum_X,'Normalization','pdf');
    std1 = std(sum_X);
    %disp(var(s1));
    %disp(std1); 
    grid on;
    hold on;
    syms r;
    disp('Experimental Variance, Mean and Standard Deviation for N = 50:');
    fprintf('Mean: %.3f\n',mean(sum_X));
    fprintf('Variance: %.3f\n',var(sum_X));
    fprintf('Standard Deviation: %.3f\n',std(sum_X));
    % Analytical Mean = N*4.5 Analytical Variance = N*5.25
    %N=50
    f_r = (1./(sqrt(2.*pi.*(262.5))).*(exp(-((r-225).^2)/(2.*(262.5)))));
    fplot(f_r, 'LineWidth', 3);
    xlabel('r');
    ylabel('f(r)');
    title('PDF for Sum of Discrete Variable from U(0,1) N=50');
    legend('Histogram','Gaussian Curve');
    %y = (1/sqrt(2*pi*(analyticalVariance))*(exp(-((x-analyticalMean).^2)/(2*(analyticalVariance)))));
end