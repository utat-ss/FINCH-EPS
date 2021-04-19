% Code to import the battery model curve data 
capacity_import = transpose(2300.*(0:1/1000:1));
Vbatt_import = NaN(3,1001);

cCover5 = xlsread('battery_data.xlsx','A3:A120');
vCover5 = xlsread('battery_data.xlsx','B3:B120');
[cCover5, index] = unique(cCover5); 
Vbatt_import(3,:) = interp1(cCover5, vCover5(index), capacity_import);

coneC = xlsread('battery_data.xlsx','C3:C113');
voneC = xlsread('battery_data.xlsx','D3:D113');
[coneC, index] = unique(coneC); 
Vbatt_import(2,:) = interp1(coneC, voneC(index), capacity_import);

ctwoC = xlsread('battery_data.xlsx','E3:E109');
vtwoC = xlsread('battery_data.xlsx','F3:F109');
[ctwoC, index] = unique(ctwoC); 
Vbatt_import(1,:) = interp1(ctwoC, vtwoC(index), capacity_import);

plot(capacity_import,Vbatt_import);

