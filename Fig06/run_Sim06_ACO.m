% This m-script for entrainability analysis for ACO2 
% this code is written by mamun
clear all 
tic
%format bank

% parameter declaration
global k K kd n b Sa Kds

% subtle asymmetric kinetics
h=1.10;
% integrated time
t_step = 0.10;                 % fixed time step
Tspan = 0:t_step:300;          % maximum time course evaluation

% initial condition seeting
y0 = [0 0 0 0 0 0];
% time delay
tau = [5 5 5 5 5 5];

% Different Coupling Values
 K1_new = linspace(0.01,4,20);

% generationg the values of forcing parameters/ periods
N = 30;
Kds_store = zeros(1,N);
for i = 1:N
    %disp(i)
Kds = 1.1 - (1.0 - 0.12)*(i-1)/(N-1);
Kds_store(i) = Kds; 
end


% entrainment Loops
for SS = 1:1:length(K1_new)
clear K(1)
% kinetic parameters
k = [10 10 10];
kd = [0.95.*h 0.95];

disp(SS)

% Critical threshold values
K(1)= K1_new(SS);
K(2) = 1;

n = 2;
b = 0.01;

% Zeitgebar strength or the tunnning parameters
Sa = 4.8;         % used value: 4.8

for i = 1:N
    %disp(i)

% forcing parameter
Kds =  Kds_store(i);

% run simulation

opt = ddeset('MaxStep',0.5);
sol0 = dde23(@EQtwo_oscillator_entrained_a,tau,y0,[0 4700],opt);

clear y00
% Re-assign initial values
            
y00 = sol0.y(:,end-2);

opts = ddeset('MaxStep',0.1);
sol = dde23(@EQtwo_oscillator_entrained_a,tau,y00,Tspan,opts);

Y = deval(Tspan,sol);

%% Characterization of oscillators   "01"
[period_02, amplitude_02, Pha_d_02] = period_amplitude_phase4_2_updt(Tspan,Y,t_step);
% stored entrained amplitude
entrain_02_amp(1,i,SS) = amplitude_02(1,1);       % oscillator 1
entrain_02_amp(2,i,SS) = amplitude_02(3,1);       % oscillator 2
entrain_02_amp(3,i,SS) = amplitude_02(5,1);       % master clock

% store entrained period
entrain_02_period(1,i,SS) = period_02(1,1);       % oscillator 1
entrain_02_period(2,i,SS) = period_02(3,1);       % oscillator 2
entrain_02_period(3,i,SS) = period_02(5,1);       % master clock

end
end

% Save The Necessary Data
% save('data_ACO_Entrainment.mat','entrain_02_period','entrain_02_amp','K1_new','Kds_store')
