function W = calculateKNNWeights(r, method)
    if strcmp(method, 'mean')
        x = ones(length(r), 1);
    elseif strcmp(method, 'inverseDistance')
        xt = r + 0.0001;
        x = 1 ./ xt;
    elseif strcmp(method, 'gauss')
        sigma = mean(r);
        x = normpdf(r, 0, sigma);
    end
    W = x / sum(x); % normalize
end