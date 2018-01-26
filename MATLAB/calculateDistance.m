function r = calculateDistance(X1, X2)
    diff = X1 - X2;
    %diff = diff ./ X1; % relative diff
    r = norm(diff);
end