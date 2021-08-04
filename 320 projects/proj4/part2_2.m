function part2_2()
    A = 1;
    var = 0.1;%variance
    n = sqrt(var) * randn(1,100000);%noise
    R = -5:0.1:5;%x of plot
    x = rand(1,100000) >= 0.6;%1 or 0
    s = zeros(1,100000);
    %IID samples using x
    for i = 1:100000
        if x(i) <= 0.6
            s(i) = 1;
        else
            s(i) = -1;
        end
    end

    R_final = s + n;
    f_r0 = (((0.6)/(sqrt(2*pi*var))) * exp((-(R-A).^2)./(2*var)));
    f_r1 = (((0.4)/(sqrt(2*pi*var))) * (exp((-(R+A).^2)./(2*var))));
    hold on
    histogram(R_final, 'Normalization', 'pdf');
    plot(R,f_r0,'Linewidth', 3);
    plot(R,f_r1,'b', 'Linewidth', 3);
    
    title('Distribution of Received Signal');
    xlabel('R');
    ylabel('Probability');
    legend('Histogram','Positive A', 'Negative A');
end
