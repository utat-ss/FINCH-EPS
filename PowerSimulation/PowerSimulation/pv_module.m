function I = pv_module(T,G,V, I_prev)
    %Code to model the output of a solar cell 

    %Intrinsic Parameters 
    Gn = 1395; % In W/m^3
    delta_T = T - 25; %in degC
    Iscn = 0.45387; % in amps
    Vocn = 2.660; % in volts
    Ns = 1;
    Ki = 0; %0.000141 ;  % Thermal coefficient of Isc (in A/degC)
    Kv = 0; %-0.0059 ;  % thermal coefficient of Voc (in A/degC)
    I_pvn = 0.45387; % in amps
    a = 2.8; %diode ideality constant (between 1 and 1.5)
    q = 1.60217646e-19;
    k = 1.3806503e-23;
    Vt = (Ns*k*(T+273))/q; % thermal voltage of Ns series connected cells

    % Parameters that I have to tune
    Rs = 0.17; %0.235; %0.005649;
    Rp = 560; %560;

    % Calculating the different solar currents 
    I_pv = (I_pvn + Ki*delta_T)*(G/Gn);

    I_o = (Iscn + Ki*delta_T) / (exp((Vocn + Kv*delta_T)/(a*Vt)) - 1); 

    I_dio = I_o*( exp((V + Rs*I_prev)/(Vt*a)) -1 );

    I_res_loss = (V + Rs*I_prev) / Rp;

    I = I_pv - I_res_loss - I_dio;
end
