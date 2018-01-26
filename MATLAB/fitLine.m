function [a,b,Rsq] = fitLine(X, Y)
    coeff = X \ Y;
    a = coeff(2);
    b = coeff(1);
    Ycalc = a.*X(:,end) + b;
    Rsq = 1 - sum((Y - Ycalc).^2)/sum((Y - mean(Y)).^2);
end