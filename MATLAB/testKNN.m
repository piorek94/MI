[X, Y] = loadStaticData('DaneUczace');
[Xv, Yv] = loadStaticData('DaneWalidacyjne');
validationDataLength = 8;
Xt = X(1:end-validationDataLength, :);
Yt = Y(1:end-validationDataLength, :);

% Xv = X(end-validationDataLength+1:end, :);
% Yv = Y(end-validationDataLength+1:end, :);
% Xv = X;
% Yv = Y;

Ym = zeros(length(Yv),1);
K = 5;
for k = 1:length(Yv)
    [T, r] = findKNN(Xt, Yt, Xv(k,:), K);
    %W = calculateKNNWeights(r, 'inverseDistance');
    W = calculateKNNWeights(r, 'gauss');
    %W = calculateKNNWeights(r, 'mean');
    Ym(k) = W' * T;
end

figure(1); clf;
plot(Yv, 'o', 'LineWidth', 3, 'MarkerSize', 6);
hold on;
plot(Ym,'x', 'LineWidth', 3, 'MarkerSize', 6);
legend('Dane laboratoryjne', 'Model', 'Location', 'northwest');
grid on;
%set(gca,'xtick',0:200)
xlabel('k');
ylabel('T_{A22}');

trainingPointsCount = length(Yv);
err = zeros(trainingPointsCount - 1, 1);
for k = 1:(trainingPointsCount - 1)
   err(k) = (Ym(k) - Yv(k)) / Yv(k) * 100; 
end
E = mean(abs(err))