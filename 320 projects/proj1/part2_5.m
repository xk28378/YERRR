function part2_5()
    %10 trial
    figure(1)
    list = (2*randn(1,10)) + 1;
    histogram(list,'Normalization', 'pdf');
    hold on
    x = [-8:0.0001:8];
    y = ((8*pi).^-0.5)*exp(-((x-1).^2)/8);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF for normal distributed random variable for 10 trials', 'σ^2 = 4, m = 1');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list); 
    fprintf('Mean for 10 trials = %0.4f\n',M);
    fprintf('Variance for 10 trials = %0.4f\n',V);
    
    %1000 trials
    figure(2)
    list = (2*randn(1,1000)) + 1;
    histogram(list,'Normalization', 'pdf');
    hold on
    x = [-8:0.0001:8];
    y = ((8*pi).^-0.5)*exp(-((x-1).^2)/8);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF for normal distributed random variable for 1,000 trials', 'σ^2 = 4, m = 1');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 1,000 trials = %0.4f\n',M);
    fprintf('Variance for 1,000 trials = %0.4f\n',V);
    
    %100000 trials
    figure(3)
    list = (2*randn(1,100000)) + 1;
    histogram(list,'Normalization', 'pdf');
    hold on
    x = [-8:0.0001:8];
    y = ((8*pi).^-0.5)*exp(-((x-1).^2)/8);
    plot(x,y,'LineWidth',4);
    xlabel('x');
    ylabel('f(x)');
    title('PDF for normal distributed random variable for 100,000 trials', 'σ^2 = 4, m = 1');
    legend('Histogram','Analytical')
    M = mean(list);
    V = var(list);
    fprintf('Mean for 100,000 trials = %0.4f\n',M);
    fprintf('Variance for 100,000 trials = %0.4f\n',V); 
end