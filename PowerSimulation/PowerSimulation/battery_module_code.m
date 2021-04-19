%battery_module_code.m
clc;
clear;
run import_battery_data.m

C = [2 1 0.5];
oneOverC = [0.5 1 2];
oneOverCsec = [0.5*60*60 1*60*60 2*60*60];
Vbatt = NaN(3,1001);
capacity = NaN(3,1001);

for j = 1:1:3
    t = 0:(oneOverCsec(j)*1.125)/1000:(oneOverCsec(j)*1.125);
    it_prev = 0;
    i_batt = C(j) * 2.250;
    
    for i=1:1:1001
        %it = integrator(i_batt,t(i),t(i-1),it_prev);
        it = t(i) * i_batt;
        Vbatt(j,i) = battery_eqn(it, i_batt);
        capacity(j,i) = i_batt * t(i);
        if Vbatt(j,i) < 2.95
            break
        end
    end
end

plot(transpose(capacity),transpose(Vbatt),capacity_import.*(60*60/1000),Vbatt_import,'--');
title('Battery Discharge Curves for Different C-Rates - Comparing Model to Datasheet')
xlabel('Capacity (As)') % x-axis label
ylabel('Voltage (V)') % y-axis label
legend('2C model','1C model','C/5 model', ... 
    '2C datasheet','1C datasheet','C/5 datasheet')
legend('Location','southwest')

% Calculate error 
sumOver5 = nansum((Vbatt_import(3,:) - Vbatt(3,:)).^2)/1001 * 100;
sumOne = nansum((Vbatt_import(2,:) - Vbatt(2,:)).^2)/1001 * 100;
sumTwo = nansum((Vbatt_import(1,:) - Vbatt(1,:)).^2)/1001 * 100;
sum = sumOver5 + sumOne + sumTwo;
