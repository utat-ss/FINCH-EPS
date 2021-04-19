% Import irradiance data

time = xlsread('pv_flux_7days.xlsx','A2:A604801');
xneg_Wm2 = xlsread('coldcase_7days.xlsx','A2:A604801');
xpos_Wm2 = xlsread('coldcase_7days.xlsx','B2:B604801');
yneg_Wm2 = xlsread('coldcase_7days.xlsx','C2:C604801');
ypos_Wm2 = xlsread('coldcase_7days.xlsx','D2:D604801');

xneg_temp = xlsread('coldcase_7days.xlsx','G2:G604801');
xpos_temp = xlsread('coldcase_7days.xlsx','H2:H604801');
yneg_temp = xlsread('coldcase_7days.xlsx','I2:I604801');
ypos_temp = xlsread('coldcase_7days.xlsx','J2:J604801');


xneg = timeseries(xneg_Wm2, time);
xpos = timeseries(xpos_Wm2, time); 
yneg = timeseries(yneg_Wm2, time);
ypos = timeseries(ypos_Wm2, time);

xnegT = timeseries(xneg_temp, time);
xposT = timeseries(xpos_temp, time); 
ynegT = timeseries(yneg_temp, time);
yposT = timeseries(ypos_temp, time);
