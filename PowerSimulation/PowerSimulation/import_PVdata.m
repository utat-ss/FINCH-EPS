% Importing the PV data from excel to make it match well to the PV model

v1000 = xlsread('PV_data.xlsx','A1:A167');
i1000 = xlsread('PV_data.xlsx','C1:C167');

i1000 = (1/1000).*i1000;

% Interpolate the data to get more points to compare with the model's
% points

% This voltage has to cover the approximate range of the pv module voltage
v_dense = 0 : 0.003 : 3;
[v1000, index] = unique(v1000); 
i1000_dense = interp1(v1000,i1000(index),transpose(v_dense));

plot(transpose(v_dense),i1000_dense);