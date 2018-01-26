nn_data = load('MODELE/Ynn_valid.mat');
Ynn = nn_data.Ynn;
knn_data = load('MODELE/Yknn_valid.mat');
Yknn = knn_data.Yknn;

dataSamples = length(Yknn);
figure(1); clf;
plot(Yknn(:,1), 'o', 'LineWidth', 3, 'MarkerSize', 6);
hold on;
plot(2:dataSamples, Ynn(:,2), 'x', 'LineWidth', 3, 'MarkerSize', 6);
plot(Yknn(:,2),'*', 'LineWidth', 3, 'MarkerSize', 6);
legend('Dane laboratoryjne', 'Sieć neuronowa', 'K-NN', 'Location', 'northwest');
grid on;

Yavg = [Yknn(1,2); (Yknn(2:end,2) + Ynn(:,2))/2];
figure(2); clf;
plot(Yknn(:,1), 'o', 'LineWidth', 3, 'MarkerSize', 6);
hold on;
plot(Yavg, 'x', 'LineWidth', 3, 'MarkerSize', 6);
legend('Dane laboratoryjne', 'Model uśredniony', 'Location', 'northwest');
grid on;

trainingPointsCount = length(Yavg);
err = zeros(trainingPointsCount - 1, 1);
for k = 1:(trainingPointsCount - 1)
   err(k) = (Yavg(k) - Yknn(k,1)) / Yknn(k,1) * 100; 
end
E = mean(abs(err))