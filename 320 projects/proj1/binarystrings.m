function binarystrings()
    %for 20 trials
    figure(1)
    trial05_20 = trial(0.5,20);
    disp(trial05_20);
    hist = histogram(trial05_20,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 20 trials with p = 0.5');
    M = mean(trial05_20);
    V = var(trial05_20); 
    fprintf('Mean for 20 trials @ p = 0.5 = %0.4f\n',M);
    fprintf('Variance for 20 trials @ p = 0.5 = %0.4f\n',V);
    
    
    figure(2)
    trial09_20 = trial(0.9,20);
    hist = histogram(trial09_20,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 20 trials with p = 0.9');
    M = mean(trial09_20);
    V = var(trial09_20); 
    fprintf('Mean for 20 trials @ p = 0.9 = %0.4f\n',M);
    fprintf('Variance for 20 trials @ p = 0.9 = %0.4f\n',V);
    
    
    figure(3)
    trial01_20 = trial(0.1,20);
    hist = histogram(trial01_20,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 20 trials with p = 0.1');
    M = mean(trial01_20);
    V = var(trial01_20); 
    fprintf('Mean for 20 trials @ p = 0.1 = %0.4f\n',M);
    fprintf('Variance for 20 trials @ p = 0.1 = %0.4f\n\n',V);
    
    %for 200 trials
    figure(4)
    trial05_200 = trial(0.5,200);
    hist = histogram(trial05_200,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 200 trials with p = 0.5');
    M = mean(trial05_200);
    V = var(trial05_200); 
    fprintf('Mean for 200 trials @ p = 0.5 = %0.4f\n',M);
    fprintf('Variance for 200 trials @ p = 0.5 = %0.4f\n',V);
    
    
    figure(5)
    trial09_200 = trial(0.9,200);
    hist = histogram(trial09_200,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 200 trials with p = 0.9');
    M = mean(trial09_200);
    V = var(trial09_200); 
    fprintf('Mean for 200 trials @ p = 0.9 = %0.4f\n',M);
    fprintf('Variance for 200 trials @ p = 0.9 = %0.4f\n',V);
    
    
    figure(6)
    trial01_200 = trial(0.1,200);
    hist = histogram(trial01_200,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 200 trials with p = 0.1');
    M = mean(trial01_200);
    V = var(trial01_200); 
    fprintf('Mean for 200 trials @ p = 0.1 = %0.4f\n',M);
    fprintf('Variance for 200 trials @ p = 0.1 = %0.4f\n\n',V);
    
    %for 2000 trials
    
    figure(7)
    trial05_2000 = trial(0.5,2000);
    hist = histogram(trial05_2000,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 2,000 trials with p = 0.5');
    M = mean(trial05_2000);
    V = var(trial05_2000); 
    fprintf('Mean for 2,000 trials @ p = 0.5 = %0.4f\n',M);
    fprintf('Variance for 2,000 trials @ p = 0.5 = %0.4f\n',V);
    
    
    figure(8)
    trial09_2000 = trial(0.9,2000);
    hist = histogram(trial09_2000,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 2,000 trials with p = 0.9');
    M = mean(trial09_2000);
    V = var(trial09_2000); 
    fprintf('Mean for 2,000 trials @ p = 0.9 = %0.4f\n',M);
    fprintf('Variance for 2,000 trials @ p = 0.9 = %0.4f\n',V);
    
    
    figure(9)
    trial01_2000 = trial(0.1,2000);
    hist = histogram(trial01_2000,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 2,000 trials with p = 0.1');
    M = mean(trial01_2000);
    V = var(trial01_2000); 
    fprintf('Mean for 2,000 trials @ p = 0.1 = %0.4f\n',M);
    fprintf('Variance for 2,000 trials @ p = 0.1 = %0.4f\n\n',V);
    
    %for 200,000 trials
    figure(10)
    trial05_200000 = trial(0.5,200000);
    hist = histogram(trial05_200000,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 200,000 trials with p = 0.5');
    M = mean(trial05_200000);
    V = var(trial05_200000); 
    fprintf('Mean for 200,000 trials @ p = 0.5 = %0.4f\n',M);
    fprintf('Variance for 200,000 trials @ p = 0.5 = %0.4f\n',V);
    
    
    figure(11)
    trial09_200000 = trial(0.9,200000);
    hist = histogram(trial09_200000,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 200,000 trials with p = 0.9');
    M = mean(trial09_200000);
    V = var(trial09_200000); 
    fprintf('Mean for 200,000 trials @ p = 0.9 = %0.4f\n',M);
    fprintf('Variance for 200,000 trials @ p = 0.9 = %0.4f\n',V);
    
    
    figure(12)
    trial01_200000 = trial(0.1,200000);
    hist = histogram(trial01_200000,'Normalization', 'probability');
    hist.BinEdges = [0:100];
    hist.NumBins = 100;
    xlabel('Indices');
    ylabel('Probability of first occurances at given index');
    title('Indices vs. Number of first occurances for 200,000 trials with p = 0.1');
    M = mean(trial01_200000);
    V = var(trial01_200000); 
    fprintf('Mean for 200,000 trials @ p = 0.1 = %0.4f\n',M);
    fprintf('Variance for 200,000 trials @ p = 0.1 = %0.4f\n',V);

end
function o_list = trial(p,m)
   %first 20
   list = [];
   for x = 1:m
       temp = [];
       for y = 1:100
           z = rand;
           if z < p
               temp(y) = 1;
           else
               temp(y) = 0;
           end
       end
       list = [list;temp];
       
   end
   %disp(list);
   o_list = [];
   indx = 1;
   while indx <= (m*100)
       if list(indx) == 1
           o_list = [o_list,mod(indx,100)];
           indx = indx +(100 - mod(indx,100));
       end
       indx = indx + 1;
   end
   
end



