% Code for transfer functions 

s = tf('s');

% Sensor section 
Ksense = 0.125;
wpsense = 100000*2*pi;
Hsense = Ksense/(1+s/wpsense);

%Plant section 
wol = 11570;
wzl = -87800;
Gl = 114;
Ql = 3.915;

woh = 12350;
wzh = -24800;
Gh = 100;
Qh = 0.973;

Glow = Gl * (1-s/wzl)/(1 + s/(Ql*wol) + (s/wol)^2) * Hsense;
Ghi = Gh * (1-s/wzh)/(1 + s/(Qh*woh) + (s/woh)^2) * Hsense;

% Compensator section
ws = 200000*2*pi;
K = 1000000;
wp1 = ws/3;
wp2 = ws/2;
wz1 = wol*1.1;
wz2 = wol*1.2;

Gc = K * ((1+s/wz1)*(1+s/wz2))/(s*(1+s/wp1)*(1+s/wp2));

Tlow = Hsense*new_C*Glow;
Thi = Hsense*new_C*Ghi;

figure (1)
bode(Glow/Hsense);
hold on;
bode(new_C);
bode (Tlow);

figure (2) 
bode(Ghi/Hsense);
hold on;
bode(new_C);
bode (Thi);


