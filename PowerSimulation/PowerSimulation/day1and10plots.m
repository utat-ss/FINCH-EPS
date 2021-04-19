%%% Something to plot the 1 day and 10 day stuff 
close all;

vpv_day1 = vpvout.data(1:3840);
vpv_day10 = vpvout.data(34561:38400);
time1 = transpose(0:22.5:86399);

vbatt_day1 = vbatt.data(1:3840);
vbatt_day10 = vbatt.data(34561:38400);

pload_day1 = load_draw.data(1:480);
pload_day10 = load_draw.data(4321:4800);
time2 = transpose(0:180:86399);

ipv_day1 = ipvout.data(1:3840);
ipv_day10 = ipvout.data(34561:38400);

ppv_day1 = ppv1.data(1:3840);
ppv_day10 = ppv1.data(34561:38400);


figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(time1,vpv_day1)
title('Vpv Day 1')
xlabel('Time (s)') % x-axis label
ylabel('Voltage (V)') % y-axis label
subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(time1,vpv_day10)
title('Vpv Day 10')
xlabel('Time (s)') % x-axis label
ylabel('Voltage (V)') % y-axis label


figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(time1,ipv_day1)
title('Ipv Day 1')
xlabel('Time (s)') % x-axis label
ylabel('Current (I)') % y-axis label
subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(time1,ipv_day10)
title('Ipv Day 10')
xlabel('Time (s)') % x-axis label
ylabel('Current (I)') % y-axis label

figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(time1,ppv_day1)
title('Ppv Day 1')
xlabel('Time (s)') % x-axis label
ylabel('Power (P)') % y-axis label
subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(time1,ppv_day10)
title('Ppv Day 10')
xlabel('Time (s)') % x-axis label
ylabel('Power (P)') % y-axis label

figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(time2,pload_day1)
title('Pload Day 1')
xlabel('Time (s)') % x-axis label
ylabel('Power (P)') % y-axis label
subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(time2,pload_day10)
title('Pload Day 10')
xlabel('Time (s)') % x-axis label
ylabel('Power (P)') % y-axis label

figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(time1,vbatt_day1)
title('Vbatt Day 1')
xlabel('Time (s)') % x-axis label
ylabel('Voltage (V)') % y-axis label
subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(time1,vbatt_day10)
title('Vbatt Day 10')
xlabel('Time (s)') % x-axis label
ylabel('Voltage (V)') % y-axis label
