
dataType = 'DaneUczace';
TI0206 = importdata(sprintf('../%s/MATLAB_mat/DR2.TI0206.PV.mat', dataType));
TI0250 = importdata(sprintf('../%s/MATLAB_mat/DR2.TI0250.PV.mat', dataType));
TI0278 = importdata(sprintf('../%s/MATLAB_mat/DR2.TI0278.PV.mat', dataType));
FC0206 = importdata(sprintf('../%s/MATLAB_mat/DR2.FC0206.PV.mat', dataType));
T_A22 = importdata(sprintf('../%s/MATLAB_mat/A22_temp_zaplonu_selected_2.mat', dataType));

figure(1); clf; hold on; grid on;
timestampOffset = TI0206(1,1);
plot((TI0206(:,1)-timestampOffset)/(24*3600), TI0206(:,2), 'o', 'DisplayName', 'TI0206');
plot((TI0250(:,1)-timestampOffset)/(24*3600), TI0250(:,2), 'o', 'DisplayName', 'TI0250');
plot((TI0278(:,1)-timestampOffset)/(24*3600), TI0278(:,2), 'o', 'DisplayName', 'TI0278');
plot((FC0206(:,1)-timestampOffset)/(24*3600), FC0206(:,2), 'o', 'DisplayName', 'FC0206');
yyaxis right;
plot((T_A22(:,1)-timestampOffset)/(24*3600), T_A22(:,2), '+', 'DisplayName', 'T_{A22}', 'MarkerSize', 12);
legend('show');
%xlim([50 350]);