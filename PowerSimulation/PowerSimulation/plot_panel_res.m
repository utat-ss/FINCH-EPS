%% plotting some stuff for assignment 2
%% Getting Ppv at 200 and 1000

% res200 = -1 ./ dydx200;
% 
% yyaxis left
% title('P-V Curve and Panel Resistance at G = 200W/m^2')
% xlabel('Voltage (V)')
% ylabel('Power (W)')
% plot(v_dense, p200);
% 
% yyaxis right
% ylabel('Panel Resistance')
% plot(v_dense, res200)


res1000 = -1 ./ dydx1000;

yyaxis left
title('P-V Curve and Panel Resistance at G = 1000W/m^2')
xlabel('Voltage (V)')
ylabel('Power (W)')
plot(v_dense, p1000);

yyaxis right
ylabel('Panel Resistance')
plot(v_dense, res1000)