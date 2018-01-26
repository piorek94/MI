dataType = 'DaneUczace';
TI0204 = importdata(sprintf('../%s/MATLAB_mat/DR2.TI0204.PV.mat', dataType));
TI0206 = importdata(sprintf('../%s/MATLAB_mat/DR2.TI0206.PV.mat', dataType));
TI0208 = importdata(sprintf('../%s/MATLAB_mat/DR2.TI0208.PV.mat', dataType));
T_A22 = importdata(sprintf('../%s/MATLAB_mat/A22_temp_zaplonu_selected_2.mat', dataType));

figure(1); clf; hold on; grid on;
timestampOffset = TI0204(1,1);
plot((TI0204(:,1)-timestampOffset)/(24*3600), TI0204(:,2), 'o');
plot((TI0206(:,1)-timestampOffset)/(24*3600), TI0206(:,2), 'o');
plot((TI0208(:,1)-timestampOffset)/(24*3600), TI0208(:,2), 'o');
yyaxis right;
plot((T_A22(:,1)-timestampOffset)/(24*3600), T_A22(:,2), '+', 'MarkerSize', 12);
legend('TI0204', 'TI0206', 'TI0208', 'T_{A22}');
%xlim([50 350]);