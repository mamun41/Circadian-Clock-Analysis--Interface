clear all

% For keeping two decimal point after decimal point
format bank;

% Here we investigate the effect of Tau_c: coupling delay(CD) Kc: coupling constant(K1)

tic

clc
global kd k K n b 

%% Parameters

t_step = 0.10;              % fixed time step

% maximum time course evaluation (4700+300)
Tspan_1 = 0:t_step:4700;
Tspan_2 = 0:t_step:300;     

% Initial concentration

y0 =zeros(4,1);
y0(1) = 0;
y0(2) = 0;
y0(3) = 0;
y0(4) = 0;
% amount of perturbation (10%) for producing subtle asymmetry set
h = 1.10;       

%%
% time delay vector
% transcriptional-translational delay (TTD = 5)

TTD = 5;
tau(1) = TTD; 
tau(2) = TTD;
tau(3) = TTD;
tau(4) = TTD;

% Coupling time-delay (tau_c = 5, used as CD)
% need to investigate the effect of coupling delay
CD = 5;

clear CD
% check the coupling delay effect
%delayNew = [0.01:0.01:0.10, 0.20:0.166:20];
% old set
%delayNew = [0.10, 0.20:0.154:20];
%K1_new = [0.01:0.01:1, 1.10:0.10:4];
% new set for update4
CD_new = [0.10:.5:20.1]; 
K1_new = [0.01, .1:0.1:4]; 

for DD = 1:1:length(CD_new)
   
    CD = CD_new(DD);
tau(5) = CD;
tau(6) = CD;


% kinetics
k(1) = 10;
k(2) = 10;

kd(1) = 0.95*h;          
kd(2) = 0.95;

% activation and repression threshold value
% Aplied: K1/K2 used as K2 and Kc use as K1

K(1) = K1_new(DD);                
K(2) = 1;                       

n= 2;
b= 0.01;

equation=@EQtwo_coupling_delay_ACO;

% Reassigning the initial values
opt = ddeset('MaxStep',0.5);
sol0 = dde23(equation,tau,y0,Tspan_1,opt);

%clear y00
% initial values
y00 = sol0.y(:,end-2);

%% Simulation
opts = ddeset('MaxStep',0.05);
sol = dde23(equation,tau,y00,Tspan_2,opts);

Y = deval(Tspan_2,sol);

%% Characterization of oscillators
[PERIOD, AMP, Pha_d] = period_amplitude_phase4_2_updt(Tspan_2,Y,t_step);

period(:,DD) = PERIOD;
amplitude(:,DD) = AMP;
phase_dif(DD) = Pha_d;

disp(PERIOD); disp(Pha_d); disp(AMP(1,1))

% Store the necessary figures 
save('data_Asym_ACO.mat','CD_new','period','amplitude','phase_dif','sol','K1_new')

end



toc