%//////////////////////////////////
% This code is written by "Mamun"
% ////////////////////////////////

% Useful link for learning the DDE23 function
%https://www.mathworks.com/matlabcentral/fileexchange/3899-tutorial-on-solving-ddes-with-dde23
%%
%Clear the work space
clear all
tic

%% 
% For keeping two decimal point after decimal point
format bank;

clc
%% declaration of global parameters
global kd k K n b 


% Initial concentration
y0 =zeros(4,1);

%y0(1) = 0;
%y0(2) = 0;
%y0(3) = 0;
%y0(4) = 0;

%% Parameters
% Intigration time step
t_step = 0.10;   

% Maximum time course evaluation
Tspan = 0:t_step:300;                

% Employed amount of assymetry in kd1
hh = 1.0;

%% Time delay vector
% Transcriptional-translational delay (TTD = 5)
TTD = 5;

tau(1) = TTD; 
tau(2) = TTD;
tau(3) = TTD;
tau(4) = TTD;

% Coupling time-delay (tau_c = 5, used as CD)
% need to investigate the effect of coupling delay
CD = 5;

tau(5) = CD;
tau(6) = CD;


% Synthesis rate kinetics
k(1) = 10;
k(2) = 10;

% Degradation rate kinetics
kd(1) = 0.95*hh;            
kd(2) = 0.95;

% Activation and Repression threshold value
% Aplied: K1/K2 used as K2 and Kc use as K1

K(1) = 0.60;                         % Coupling dissociation parameter                
K(2) = 1;                            % Repression dissociation parameter

n= 2;                                % Hill n
b= 0.01;                             % Leaky expression


%% Run Simulation

% ACO: ode modeling
equation=@EQtwo_ACO;

opts = ddeset('MaxStep',0.5);
%opts = odeset('RelTol',1e-6,'AbsTol',1e-6);
sol0 = dde23(equation,tau,y0,[0 4700],opts);

% For stable time-course
clear y00
% initial values
y00 = sol0.y(:,end-2);
%% Again run Simulation

opts = ddeset('MaxStep',0.1);
sol = dde23(equation,tau,y00,Tspan,opts);

%% Characterization of oscillators
Y = deval(Tspan,sol);
%% Characterization of oscillators
[PERIOD, AMP, Pha_d] = period_amplitude_phase4_2_updt(Tspan,Y,0.1);

disp(PERIOD); disp(Pha_d); disp(AMP)

A=zeros(4,1);                   
AA=zeros(4,1);                  

A = PERIOD;                     %Sym period
AA = AMP;                       %Sym amplitude
PD = Pha_d;                     %Symphase difference


% Phase difference to single parameter perturvation
Asym_kd1= linspace(.95,1.5,50);    % kd1 perturb values

for j=1:1:length(Asym_kd1)
    
        disp(j)
        clear kd(1)
        
        kd(1)= Asym_kd1(j);
        % run simulations to changed kd1      
        opt = ddeset('MaxStep',0.5);
        sol0 = dde23(equation,tau,y0,[0 4700],opt);
        
        %% Reassigning the initial values
        clear y00
        % initial values
        y00 = sol0.y(:,end-2);
        
        %% Simulation
        opts = ddeset('MaxStep',0.1);
        sol = dde23(equation,tau,y00,Tspan,opts);
        
        Y = deval(Tspan,sol);
        
%% Characterization of oscillators
   [PERIOD, AMP, Pha_d] = period_amplitude_phase4_2_updt(Tspan,Y,0.1);
        
        B(:,j)=PERIOD;      % Calculated new periods     
        BA(:,j)=AMP;        % Calculated new amplitudess          
        Pd(j)=Pha_d;        % Calculated phase differences  
        
% store the necessary data
save('data_phase_ACO.mat','B','BA','Pd','sol','Asym_kd1')

end

toc