% Whole PV module not in simulink because fuck that
run import_PVdata.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the data and stuff for the irradiance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 25;
G = [1395 1000 800 600];
i_calc = zeros(3,1001);
p_calc = zeros(3,1001);

v_ramp = 0 : 0.003  : 3;
I_prev = 0;
P_prev = 0;
 
for j=1:1:4
    for i=1:1:1001
       temp = pv_module(T,G(j),v_ramp(i),I_prev);
       if (temp < 0)
           i_calc(j,i) = 0;
           p_calc(j,i) = 0;
       else
           i_calc(j,i) = temp;
           p_calc(j,i) = temp*v_ramp(i);
       end
       I_prev = i_calc(j,i);
       P_prev = p_calc(j,i);
    end
end

% Plot the calculated and extracted data
figure(1)
plot(v_ramp,i_calc(1,:),'r',v_ramp,i_calc(2,:),'m',v_ramp,i_calc(3,:),'g',v_ramp,i_calc(4,:),'b',...
    v_dense,i1000_dense,'k');
hold on
yyaxis right
plot(v_ramp,p_calc(1,:),'r--',v_ramp,p_calc(2,:),'m--',v_ramp,p_calc(3,:),'g--',v_ramp,p_calc(4,:),'b--');
ylabel('Power (W)') % y-axis label

yyaxis left
title('PV and IV Curves Under Different Irradiance Conditions - Comparing Model to Datasheet')
xlabel('Voltage (V)') % x-axis label
ylabel('Current (I)') % y-axis label
legend('1395 W/m^2 model','1000 W/m^2 model','800 W/m^2 model','600 W/m^2 model', ... 
    '1395 W/m^2 datasheet' )
legend('Location','southwest')
hold off

% Calculate the error
sum1000 = nansum((transpose(i1000_dense) - i_calc(1,:)).^2)/1001 * 100;
sumirr = sum1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the data for temperature 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = [80 50 25 -5];
G = 1395;
i_tcalc = zeros(3,1001);
v_ramp = 0 : 0.003  : 3;
I_prev = 0;

for j=1:1:4
    for i=1:1:1001
       temp = pv_module(T(j),G,v_ramp(i),I_prev);
       if (temp < 0)
           i_tcalc(j,i) = 0;
       else
           i_tcalc(j,i) = temp;
       end
       I_prev = i_tcalc(j,i);
    end
end

% Plot the calculated and extracted data
figure(2)
plot(v_ramp,i_tcalc(1,:),v_ramp,i_tcalc(2,:),v_ramp,i_tcalc(3,:),v_ramp,i_tcalc(4,:));
title('PV IV Curve Under Different Temperature Conditions')
xlabel('Voltage (V)') % x-axis label
ylabel('Current (I)') % y-axis label
legend('80 degC model','50 degC model','25 degC model','-5 degC model')
legend('Location','southwest')