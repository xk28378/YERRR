function part2_1()
    %Plot Tau_map as a function of p0
    p_0 = (0.01:.01:0.99);
    %Sigma^2 = 1/ Gamma = 1/10
    var = 0.1;
    T_map = (var/2) .* log( ((1-p_0)) ./ p_0 );%Tau_map equation
    figure(1)
    plot(p_0, T_map,'Linewidth',2);
    title('T_{map}(p_{0})');
    xlabel('p_0');
    ylabel('T_{map}');
end