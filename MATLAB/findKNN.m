function [T, r] = findKNN(X, Y, Xin, K)
    N = length(Y);
    R = zeros(N,1);
    for k = 1:N
        R(k) = calculateDistance(X(k,:), Xin);
    end
    M = [R X Y];
    Ms = sortrows(M); % sort by distance, ascending
    r = Ms(1:K,1);
    T = Ms(1:K,end);
end