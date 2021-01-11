clc; clear all; close all;

% Variabili: densitá, fracture toughness e sigma di fatica di ogni materiale candidato

N_materiali = 5;

% Range di densitá  [kg/m³]
%rho_B1900 = [8.15 8.3] * 10e3;          
rho_MARM432 = [8.05 8.25] * 10e3;
rho_IN162 = [8 8.15] * 10e3;
rho_IN738C = [8 8.2] * 10e3;
rho_IN738LC = [8 8.2] * 10e3;
rho_MARM421 = [8 8.15] * 10e3;

% Media dei range [kg/m³]
%rho_B1900 = mean (rho_B1900);
rho_MARM432 = mean (rho_MARM432);
rho_IN162 = mean (rho_IN162);
rho_IN738C = mean (rho_IN738C);
rho_IN738LC = mean (rho_IN738LC);
rho_MARM421 = mean (rho_MARM421);

Rho = [rho_MARM432 rho_IN162 rho_IN738C rho_IN738LC rho_MARM421];

% Range di sigma di fatica [MPa]
%sigma_B1900 = [345 535];
sigma_MARM432 = [445 685];
sigma_IN162 = [360 510];
sigma_IN738C = [390 605];
sigma_IN738LC = [290 355];
sigma_MARM421 = [385 595];

% Media dei range [MPa]
%sigma_B1900 = mean (sigma_B1900);
sigma_MARM432 = mean (sigma_MARM432);
sigma_IN162 = mean (sigma_IN162);
sigma_IN738C = mean (sigma_IN738C);
sigma_IN738LC = mean (sigma_IN738LC);
sigma_MARM421 = mean (sigma_MARM421);

Sigma = [sigma_MARM432 sigma_IN162 sigma_IN738C sigma_IN738LC sigma_MARM421];

% Range di Fracture toughness [MPa * m^0.5]
%k_B1900 = [48.4 53.8];
k_MARM432 = [35.9 39.8];
k_IN162 = [42.3 47];
k_IN738C = [36.4 40.4];
k_IN738LC = [44.4 49.4];
k_MARM421 = [30.5 33.8];

% Media dei range [MPa * m^0.5]
%k_B1900 = mean (k_B1900);
k_MARM432 = mean (k_MARM432);
k_IN162 = mean (k_IN162);
k_IN738C = mean (k_IN738C);
k_IN738LC = mean (k_IN738LC);
k_MARM421 = mean (k_MARM421);

K = [k_MARM432 k_IN162 k_IN738C k_IN738LC k_MARM421];



%% CALCOLO DEGLI INDICI DI INTERESSE

i = 1;
Index_frac_tough = [0 0 0 0 0 0];

for i = 1:N_materiali

    Index_frac_tough (i) = K (i) / Rho (i);
    i = i + 1;

end 

j = 1;
Index_fatigue = [0 0 0 0 0 0];

for j = 1:N_materiali
     
    Index_fatigue (j) = Sigma (j) / Rho (j);
    i = j + 1;

end 

%% Indici target: Sono entrambi da massimizzare al fine di ridurre il peso

Index_fatigue_TARGET = max (Index_fatigue);
Index_frac_tough_TARGET = max (Index_frac_tough);

