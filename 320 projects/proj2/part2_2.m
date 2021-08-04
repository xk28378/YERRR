function part2_2()
    figure(1);
    %analytical graph
    syms s
    f_s =   piecewise(s <= 0, 0, s > 0,( 1 / (sqrt(2*pi * (9/16) ) ) * ( exp (-( (s-2).^2) / (2* (9/16)) )+ ( exp (-( (s+2).^2) / (2* (9/16)) )) )));
    fplot(f_s,'Linewidth',3);
    
    %simulation graph
    A = 2; % Known Amplitude
    sigma2 = 9/16; % Known Noise Variance
    N = sqrt(sigma2) * randn(1,100000); % N(0,9/16)
    X = (rand(1,100000)<=0.5)*A; % Create X as a random function less than 0.5 with amplitude A
    X = 2*(X - A/2); % Set X as 2 * the random function - 1
    R = X + N; % Create the Recieved Signal
    hold on;
    %mean of the function
    T = mean(abs(R(:)));
    disp('Jenson''s Inequality evalution for 2.2');
    fprintf('g(E[x]): %.3f\n',T);
    %setup up trials
    S = [];
    for i=1:100000 
        S = [S,abs(R(i))]; 
    end
    %simulation mean 
    M = mean(S);
    fprintf('E[g(x)]: %.3f\n',M);
    disp('The Jensen''s inequality rule states E[g(X)]≥g(E[X]) which holds for this trial.');
    %histogram
    histogram(S,'Normalization','pdf');
    %graph detials
    xlabel('s(Volts)');
    ylabel('f_S(s)');
    title('PDF f_S(s) S = |R|');
    legend('Analytical','Histogram');
    grid on
    
end