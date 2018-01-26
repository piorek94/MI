%fileName = 'DR2.TI0204.PV.mat';
%fileName = 'DR2.TI0206.PV.mat';
%fileName = 'DR2.TI0208.PV.mat';
%fileName = 'DR2.TI0240.PV.mat';
%fileName = 'DR2.TI0210.PV.mat';
%fileName = 'DR2.TI0240.PV.mat';
%fileName = 'DR2.TI0250.PV.mat';
%fileName = 'DR2.TI0278.PV.mat';
%fileName = 'DR2.TC0235.PV.mat';
%fileName = 'DR2.FC0206.PV.mat';
%fileName = 'DR2.FC0207.PV.mat';
%fileName = 'DR2.FC9021.PV.mat';
%fileName = 'DR2.LC0202.PV.mat';
%fileName = 'DR2.PI0204.PV.mat';
fullPath = sprintf('../DaneUczace/MATLAB_mat/%s', fileName);
input = importdata(fullPath);
% T_A22 = importdata('../Dane/MATLAB_mat/A22_temp_zaplonu.mat');
T_A22 = importdata('../DaneUczace/MATLAB_mat/A22_temp_zaplonu_mod.mat');
%T_A22 = importdata('../DaneUczace/MATLAB_mat/T_A22_selected.mat');
%T_A22 = importdata('../DaneUczace/MATLAB_mat/A22_temp_zaplonu_selected_2.mat');

inputName = fileName(5 : end-7);
staticPoints = length(T_A22);
staticCharacteristic = calculateStaticCharacteristic(T_A22, input);

X = [ones(staticPoints,1) staticCharacteristic(:,2)];
Y = staticCharacteristic(:,1);
[a,b,Rsq] = fitLine(X,Y);



clf; hold on; grid on;
plot(staticCharacteristic(:,2), staticCharacteristic(:,1), 'o');
xlabel(inputName);
ylabel('T_{A22} [C]');
title(sprintf('R^2 = %.3f', Rsq));
%print(figure(1), sprintf('../Dokumenty/Wykresy/StatyczneTestowe/%s.png',inputName), '-dpng', '-r150');