[X, Y] = loadNNData('DaneWalidacyjne');
%[X, Y] = loadNNData('DaneUczace');
nn = best_nn;
Xvalid = {X(:,1)'; X(:,2)'; X(:,3)'; X(:,4)'; X(:,5)'; X(:,6)'; X(:,7)'; X(:,8)'; X(:,9)';};

ymod_valid=sim(nn,Xvalid);

close all;
figure(1); clf;
plot(Y, 'o', 'LineWidth', 3, 'MarkerSize', 6);
hold on;
plot(ymod_valid{1},'x', 'LineWidth', 3, 'MarkerSize', 6);
legend('Dane laboratoryjne', 'Model');
grid on;
%set(gca,'xtick',0:200)
xlabel('k');
ylabel('T_{A22}');

trainingPointsCount = length(Y);
err = zeros(trainingPointsCount - 1, 1);
for k = 1:(trainingPointsCount - 1)
   err(k) = (ymod_valid{1}(k) - Y(k)) / Y(k) * 100; 
end
mean(abs(err))

Tin = 25 : 1 : 40;
Tout = zeros(1, length(Tin));
for k = 1:length(Tin)
    Xzero = {Tin(k); 0;0;0;0;0;0;0;0;};
    simOut = sim(nn, Xzero);
    Tout(k) = simOut{1};
end

figure;
plot(Tin, Tout);
grid on;

in_min = -20;
in_max = 20;
in = -20 : 0.2 : 20;
Tin = 35;
for k = 1:length(in)
    Xtest = {Tin; 0;0;0;0;0;in(k);0;0;};
    simOut = sim(nn, Xtest);
    Tout(k) = simOut{1};
end

figure;
plot(in, Tout);
grid on;