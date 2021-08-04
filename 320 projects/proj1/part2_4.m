function part2_4()
    %10 trial
    figure(1)
    list = randn(1,10);
    histogram(list,'Normalization', 'pdf');
    hold on
    x = [-3:0.0001:3];
    y = ((2*pi).^-0.5)*exp((-x.^2)/2);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF for normal distributed random variable for 10 trials');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 10 trials= %0.4f\n',M);
    fprintf('Variance for 10 trials = %0.4f\n',V);
    
    %1000 trials
    figure(2)
    list = randn(1,1000);
    histogram(list,'Normalization', 'pdf');
    hold on
    x = [-3:0.0001:3];
    y = ((2*pi*(1.^2)).^-0.5)*exp((-x.^2)/2);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF for normal distributed random variable for 1,000 trials');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 1,000 trials= %0.4f\n',M);
    fprintf('Variance for 1,000 trials= %0.4f\n',V);
    
    %100000 trials
    figure(3)
    list = randn(1,100000);
    histogram(list,'Normalization', 'pdf');
    hold on
    x = [-3:0.0001:3];
    y = ((2*pi).^-0.5)*exp((-x.^2)/2);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF for normal distributed random variable for 100,000 trials');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 100,000 trials= %0.4f\n',M);
    fprintf('Variance for 100,000 trials= %0.4f\n',V);
end