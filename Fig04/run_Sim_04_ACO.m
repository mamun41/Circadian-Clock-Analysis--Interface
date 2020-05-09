% These code to investigating the noise effect on phase movement
% Here noise means extrinsic noise via 10% percent random perturbations of
% the parameters simultenously  along with period and amplitudes

% close all
% format bank

clear all 

% parameter setting
global k kd K n b 

tic
clc

rng('shuffle')

t_step = 0.10;                % Fixed simulation time step

% Maximum time course evaluation
Tspan = 0:t_step:600;     

%
% Different amount of random variations
for kk = 1:1:3

    if kk==1
    H = 0.01;                  %   1 percent variation 
        
    elseif kk ==2
        H = 0.05;              %   5 percent variation
        
    elseif kk ==3
        H = 0.10;              %   10 percent variation 
               
    end
    
%% new coupling intensity vector
K1_new = [0.01, .1:0.1:4]; 

% new coupling delay vector
CD_new = [0.10:.5:20.1]; 

%% Run the loop

    for q = 1:1:length(K1_new)
        clear K(1)
        
 % No. of sinulation run for each K1 & CD
        Nrep = 40; 
        disp(q)
        for i = 1:1:Nrep
            clear sol0
            
            % kinetic parameter for ACO
            
            k(1) = normrnd(10,10*H);
            k(2) = normrnd(10,10*H);
        
            kd(1) = normrnd(0.95,0.95*H);
            kd(2) = normrnd(0.95,0.95*H);
        
            K(1) = K1_new(q);
            K(2) = 1;
            
            % delay vector
            
            % *TTD effect are already demonstrated by the Paul Smolen et al. 2001, 2002*
            TTD = 5;    
            tau(1) = TTD; 
            tau(2) = TTD; 
            tau(3) = TTD; 
            tau(4) = TTD; 
            
            % Coupling Delay (CD = 5)
            % need to investigate the effect of coupling delay
            CD = CD_new(q); 
            
            tau(5) = CD;
            tau(6) = CD;
                
            n = 2;                      % Hill coefficient
            b = 0.01;                   % leaky expression
        
            % initial molecular concentration y1 y2 y3 y4 
            y0 = [0 0 0 0]';
            
            % run simulations
            equation=@EQtwo_coupling_delay_ACO;
            
            %opt = ddeset('MaxStep',0.5);
            %sol0 = dde23(equation,tau,y0,[0 4600],opt);
            
            % Reassigning the initial values
            %clear y00
            % initial values
            
            %y00 = sol0.y(:,end-2);
            %% Simulation
            opts = ddeset('MaxStep',0.1);
            sol = dde23(equation,tau,y0,Tspan,opts);
            
            Y = deval(Tspan,sol);
            %% Characterization of oscillators
            [PERIOD, AMP, Pha_d] = period_amplitude_phase4_2_updt(Tspan,Y,t_step);

    
    
            % store the simulated value
            
            if kk==1
                P_stor_1_percent(:,i,q) = PERIOD;
                A_stor_1_percent(:,i,q) = AMP;
                Ph_stor_1_percent(q,i) = Pha_d;
            elseif kk==2
                P_stor_5_percent(:,i,q) = PERIOD;
                A_stor_5_percent(:,i,q) = AMP;
                Ph_stor_5_percent(q,i) = Pha_d;
            elseif kk==3
                P_stor_10_percent(:,i,q) = PERIOD;
                A_stor_10_percent(:,i,q) = AMP;
                Ph_stor_10_percent(q,i) = Pha_d;
            end
        end
        
    end
end
            
% store the necessary data
save('data_externalNoise_ACO.mat','CD_new','P_stor_1_percent','P_stor_5_percent','P_stor_10_percent','A_stor_1_percent','A_stor_5_percent','A_stor_10_percent','Ph_stor_1_percent','Ph_stor_5_percent','Ph_stor_10_percent','K1_new','sol')

toc
