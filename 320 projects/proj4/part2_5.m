%2.5 = 2.4/2.3
function part2_5()
    g = [1:0.5:8, 8.5:0.25:13];%gamma
    var = 10.^(g/-10);
    tau = (log10(0.4/0.6) .* var)./2;
    t_0_6 = 1 - tau;%p
    t_0_4 = 1 + tau;%1-p

    analytical_p0_50 = 0.5*erfc(1./(sqrt(2)*sqrt(var)));%2.3
    analytical_p0__60 = 0.3*erfc(t_0_6./(sqrt(2).*sqrt(var))) + 0.2*erfc(t_0_4./(sqrt(2).*sqrt(var)));%2.4
    
    figure(1)
    semilogy(g,analytical_p0__60,'g', 'Linewidth', 3); 
    hold on
    semilogy(g,analytical_p0_50, '-oR', 'Linewidth', 1);
    xlabel('Gamma');
    ylabel('Probability of Error');
    title('Analytical at p_0 = 0.6 vs Analytical at p_0 = 0.5');
    legend('Analytical at p_{0} = 0.6','Analytical at p_{0} = 0.5');

    %rho function
    figure(2)
    p = analytical_p0__60 ./ analytical_p0_50;
    plot(g, p, 'Linewidth', 3);
    xlabel('Gamma');
    ylabel('Ratio');
    
    title('Ratio of p_0 = 0.6 / p_0 = 0.5 as a funtion of Gamma');
end