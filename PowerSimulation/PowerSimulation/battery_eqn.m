function Vbatt = battery_eqn(it, i_batt)
% Function that will model the lithium ion battery 

%E = 3.6; % No load voltage (V)
E0 = 3.6;%3.7348; % Battery constant voltage (V)
K = 0.01;%0.00876; %polarisation voltage (V)
Q = 8100; % or 2.87Ah;  % battey capacity (As)
A = 0.7; %0.468; %exponential zone amplitude (V)
B = 0.0003; %3.5294; %exponential zone time constant inverse (Ah)^-1
R = 0.09; % internal resistance (Ohms)

E = E0 - K*(Q/(Q-it)) + A*exp(-B*it); 
Vbatt = E - i_batt*R;
end

