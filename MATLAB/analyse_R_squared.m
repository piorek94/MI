loadFileNames;

T_A22 = importdata('../DaneUczace/MATLAB_mat/A22_temp_zaplonu_mod.mat');
%T_A22 = importdata('../DaneUczace/MATLAB_mat/A22_temp_zaplonu_selected_2.mat');
for j = 3:filesCount
    inputName = files{j}(1 : end-4);
    fullPath = sprintf('../DaneUczace/MATLAB_mat/%s.mat', inputName);
    input = importdata(fullPath);
    staticPoints = length(T_A22);
    staticCharacteristic = calculateStaticCharacteristic(T_A22, input);

    X = [ones(staticPoints,1) staticCharacteristic(:,2)];
    Y = staticCharacteristic(:,1);
    [a,b,Rsq] = fitLine(X,Y);

    disp(sprintf('%s    %.3f', inputName, Rsq));
end