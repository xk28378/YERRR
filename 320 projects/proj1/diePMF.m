
function diePMF()
    %120 trials
    figure(1)
    list120 = randi(6,1,120);
    hist = histogram(list120,'Normalization', 'probability');
    xlabel('Role of the fair die');
    ylabel('Probability of occurances');
    title('PMF for Occurances for 120 trials');
    M = mean(list120);
    V = var(list120);
    fprintf('The sample mean for 120 trials: %.3f\n',M);
    fprintf('The sample variance for 120 trials: %.3f\n\n',V);
    
    %1200 trials
    figure(2)
    list1200 = randi(6,1,1200);
    hist = histogram(list1200,'Normalization', 'probability');
    xlabel('Role of the fair die');
    ylabel('Probability of occurances');
    title('PMF for Occurances for 1,200 trials');
    M = mean(list1200);
    V = var(list1200);
    fprintf('The sample mean for 1,200 trials: %.3f\n',M);
    fprintf('The sample variance for 1,200 trials: %.3f\n\n',V);
    
    %12000 trials
    figure(3)
    list12000 = randi(6,1,12000);
    hist = histogram(list12000,'Normalization', 'probability');
    xlabel('Role of the fair die');
    ylabel('Probability of occurances');
    title('PMF for Occurances for 12,000 trials');
    M = mean(list12000);
    V = var(list12000);
    fprintf('The sample mean for 12,000 trials: %.3f\n',M);
    fprintf('The sample variance for 12,000 trials: %.3f\n\n',V);
    
    %120000 trials
    figure(4)
    list120000 = randi(6,1,120000);
    hist = histogram(list120000,'Normalization', 'probability');
    xlabel('Role of the fair die');
    ylabel('Probability of occurances');
    title('PMF for Occurances for 120,000 trials');
    M = mean(list120000);
    V = var(list120000);
    fprintf('The sample mean for 120,000 trials: %.3f\n',M);
    fprintf('The sample variance for 120,000 trials: %.3f\n\n',V);
     
end

