function part2_3()
    g = [1:0.5:8, 8.5:0.25:13];%gamma
    var = 10.^(g/-10);%variance
    
    %getting 1 and 0
    bk = zeros(1,1000000);
    bk_old =  rand(1,1000000);
     for i = 1:100000
         bk(i) = bk_old(i);
        if bk(i) < 0.5
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
    
    %adding noise
    R = zeros(1,1000000);%recieved signal with noise
    errors = zeros(1,1000000);%errors
    pb_X = zeros(1,34);
    bk_hat = zeros(1,1000000);
    for i = 1:length(var)
        noise = sqrt(var(i)) * randn(1,1000000);
        for j = 1:1000000
            R(j) = m(j) + noise(j);
            bk_hat(j) = R(j);
            if bk_hat(j) >= 0
                bk_hat(j) = 0;
            else
                bk_hat(j) = 1;
            end
            errors(j) = xor(bk_hat(j), bk(j));
        end
        s = sum(errors(:)==0);
        pb_X(i) = s/1000000;
    end

    %generate analytical function
    analytical = 0.5*erfc(1./(sqrt(2*var)));
    figure(1)%plot using semilogy
    semilogy(g,analytical,'g', 'Linewidth', 3);%plot analytical
    hold on;
    semilogy(g,pb_X, '-or', 'Linewidth', 1.5);%plot simulation
    xlabel('Gamma');
    ylabel('Probability of Error');
    legend( 'Analytical','Simulation');
    title('ML Detector');
end