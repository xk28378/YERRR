function part2_6()
    %Unscaled histogram
    list = (2*randn(1,1000000)) + 1;
    figure(1)
    hist1 = histogram(list);
    hist1.BinWidth = 0.1;
    x_values1 = find(hist1.BinEdges >= 1.0 & hist1.BinEdges < 3.0);
    pdf_sum1 = sum(hist1.Values(x_values1));
    prob = pdf_sum1 / 1000000;
    fprintf('Unscaled Sample probability: %0.4f\n',prob);
    
    %Scaled histogram
    figure(2)
    hist2 = histogram(list,'Normalization', 'pdf');
    hist2.BinWidth = 0.1;
    x_values2 = find(hist2.BinEdges >= 1.0 & hist1.BinEdges < 3.0);
    pdf_sum2 = sum(hist2.Values(x_values2));
    numeric_integ = pdf_sum2 * hist2.BinWidth;
    fprintf('Scaled Sample probability: %0.4f\n',numeric_integ);
    
    %True PDF probability
    f_x = @(x) ((8*pi).^-0.5)*exp(-((x-1).^2)/8);
    integ = integral(f_x,1,3);
    fprintf('True PDF probability: %0.4f\n',integ); 
end