Kmax = 16;


bestE = 9999999;
bestK = 1;
Ek = zeros(1, Kmax);

for K = 1:Kmax
    testKNN;
    Ek(K) = E;
    if(bestE > E)
        bestE = E;
        bestK = K;
    end
end

figure(2); clf;
plot(1:Kmax, Ek, 'x', 'LineWidth', 3, 'MarkerSize', 6);
grid on;
xlabel('K');
ylabel('E [%]');