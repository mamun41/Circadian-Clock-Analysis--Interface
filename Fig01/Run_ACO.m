
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
% for keeping two decimal point after decimal point
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

t_step = 0.10;                       % Intigration time step

Tspan = 0:t_step:800;                % Maximum time course evaluation

% Employed amount of assymetry in kd1
hh = 1.0;

%% Time delay vector
% Transcriptional-translational delay (TTD = 5)
TTD = 5;

tau(1) = TTD; 
tau(2) = TTD;
tau(3) = TTD;
tau(4) = TTD;

% Coupling time-delay (Tau_c = 5, used as CD)
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

opts = ddeset('MaxStep',0.1);
%opts = odeset('RelTol',1e-6,'AbsTol',1e-6);
sol = dde23(equation,tau,y0,Tspan,opts);

% Fixing the required vector size
Y = deval(Tspan,sol);

%% Characterization of oscillation parameters

[PERIOD, AMP, Pha_d] = period_amplitude_phase4_2_updt(Tspan,Y,t_step);

disp(PERIOD); disp(Pha_d); disp(AMP)

%{
% Not necessary part
% Phase-shift curve
Nrep = 1;
    
[y1_max_val, y1_lag] = findpeaks(Y(1,:));   % for oscillator 1:Y1
[y3_max_val, y3_lag] = findpeaks(Y(3,:));   % for oscillator 2:Y3
days = size(y1_lag,2);

for j = 1: days
  
    [Yphase_abs_val, Yphase_index] = min(abs(y1_lag(j) - y3_lag));
    Yphase_shift(j) = (y1_lag(j) - y3_lag(Yphase_index)).*0.1;  % 0.1 = time interval

end

phase_dd =  Yphase_shift;


figure
subplot(212)
plot(y1_lag*0.10, abs((phase_dd)),'r', 'LineWidth',5)
set(gca,'fontname','arial','fontsize',14,'fontweight','bold','linewidth',2,'XLim',[0 300],'Xtick',[0 150 300],'Ylim',[0 12],'Ytick',[0 4 8 12]);
xlabel('Time (a.u.)','fontname','arial','fontsize',14)
ylabel ('Phase difference','fontname','arial','fontsize',14)
%}


%% Plot
%figure
subplot(211)
plot(sol.x,sol.y(1,:),'r','linewidth',4);hold on; 
plot(sol.x,sol.y(3,:),'g','linewidth',3);hold on;
h1 = legend('Y_1','Y_3'); 
set(gca,'fontname','arial','fontsize',14,'fontweight','bold','linewidth',2,'XLim',[0 300],'Xtick',[0 150 300],'Ylim',[0 12],'Ytick',[0 6 12]);
xlabel('Time (h)','fontname','arial','fontsize',14);
ylabel('Amplitude (a.u.)','fontname','arial','fontsize',14);
title('ACO','fontname','arial','fontsize',14);
box on;

subplot(212)
plot(sol.y(1,:),sol.y(3,:),'color',[0,0.4470, 1],'linewidth',4);hold on; % 'Color',[0.75 0 0.75]
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',2,'XLim',[0 12],'Xtick',[0 6 12],'Ylim',[0 12],'Ytick',[0 6 12]);
xlabel('[Y_1]','fontname','arial','fontsize',12);
ylabel('[Y_3]','fontname','arial','fontsize',12);
title('ACO','fontname','arial','fontsize',14);
box on;
hold off
toc