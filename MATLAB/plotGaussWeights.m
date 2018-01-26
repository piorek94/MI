r = [9.4869; 13.5565; 18.3257; 23.5658; 25.1056];
sigma = mean(r);

x = [0:.1:40];
norm = normpdf(x, 0, sigma);
norm_r = normpdf(r, 0, sigma);
figure(1); clf;
plot(x, norm);
hold on;
plot(r, norm_r, 'x', 'LineWidth', 3, 'MarkerSize', 6);
grid on;
xlabel('r');
%xlim([0 30]);