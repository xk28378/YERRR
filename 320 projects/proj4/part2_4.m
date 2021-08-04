function part2_4()
    g = [1:0.5:8, 8.5:0.25:13];%gamma
    var = 10.^(g/-10);%variance
    tau = (log10(0.4/0.6).*var)/2;

    %getting 1 and 0
    bk = zeros(1,1000000);
    bk_old =  rand(1,1000000);
     for i = 1:100000
         bk(i) = bk_old(i);
        if bk(i) <= 0.6
            bk(i) = 0;
        else
            bk(i) = 1;
        end
     end

    %mapping 1 and 0 to positive and negative
    m = zeros(1,1000000);
    for i = 1:1000000
        m(i) = bk(i);
        if m(i) == 0
            m(i) = -1;
        else
            m(i) = 1;
        end
    end
    
    %add noise in order to get bk_hat
    r = zeros(1,1000000);%received singal
    e = zeros(1,1000000);%errors
    pb_X = zeros(1,34);
    bk_hat = zeros(1,1000000);
    for i = 1:length(var)
        noise = sqrt(var(i)) * randn(1,1000000);
        for j = 1:1000000
            if m(j) + noise(j) < tau(i)
                bk_hat(j) = 1;
            elseif m(j) + noise(j) >= 0
                bk_hat(j) = 0;
            end
            e(j) = xor( bk_hat(j),bk(j));
        end
        
        s = sum(e(:)== 0);
        pb_X(i) = s/1000000;
    end

    %generate analytical function
    top = 1-tau;
    top_1 = tau + 1;
    analytical = 0.3*erfc(top./(sqrt(2).*sqrt(var))) + 0.2*erfc(top_1./(sqrt(2).*sqrt(var)));
    figure(1)%plot using semilogy
    semilogy(g,analytical,'g', 'Linewidth', 3);%plot analytical
    hold on;
    semilogy(g,pb_X, '-or', 'Linewidth', 1.5);%plot simulation
    xlabel('Gamma');
    ylabel('Probability of Error');
    legend( 'Analytical','Simulation');
    title('MAP Detector');
end