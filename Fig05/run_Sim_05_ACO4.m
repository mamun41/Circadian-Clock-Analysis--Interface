%   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
% DSSA code encoding by Md: Mamunur Rashid
% DSSA algorithm is followed from "Oscillatory regulation of Hes1"
% author: manuel barrio,..., tihan hai
% this model for "activator" coupled oscillator
%   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

% Clear all
clear all

tic

% clear the console skin
clc
% Number of single cell simulation
Ntraj = 200;

% changed coupling vector
K1_new = 0.01:.04:4;


for WW = 1:1:1
    %disp(WW)
    clear K(2)
    
    
for II = 1:1:length(K1_new)
     clear K(1)
     disp(II)
% 
for trajnum = 1:Ntraj
clear X delay 
clear t_out N_out y_out A  
clear mu pending
rng('shuffle')

% Number of rections
nreactions = int8(8);
nspecies = int8(4);


% Initialization general kinetics
b = 0.01; n = 2; n1 = 1;
% volume parameter
v = 1*1;                        % volume* No. of molecule


% Production rete kinetics       % degradation rate constant
k(1) = 10*v;                      kd(1) = 0.95; 
k(2) = 10*v;                      kd(2) = 0.95;

% Dissotiation constant
K(1) = K1_new(II)*v;
K(2) = WW*v;

% Delay parameter
delay = [5 5 5 5 0 0 0 0];


% Run parameters
tmax = 10000;             % max simulation time 
save_interval = 0.1;      % record time step
told = 0;

Tout = [0:save_interval:tmax];
numtosave = length(Tout);

% stoichiometric matrix
tm = [1 0 0 0 -1 0 0 0; 0 1 0 0 0 -1 0 0; 0 0 1 0 0 0 -1 0; 0 0 0 1 0 0 0 -1];

Nout = zeros(nspecies,numtosave);
    
    clear schedule
    % store delayed reaction
    schedule = zeros(1,2);
   
    t = 0;
    step = 1;
    X = [0 0 0 0]';
    nsaved = 1;
    % *************************
    Tout(1) = t;
    Nout(:,1) = X;
    
    % *************************
    t_out(1) = t;
    y_out(:,1) = X;
        
    % Main Loop
    
   
    while t < tmax
            
        % Calculate Reaction propensities
         A(1) = b + k(1) * hillR(X(2),n,K(2)) * hillA(X(4),n1,K(1));
         A(2) = X(1);
         A(3) = b + k(2) * hillR(X(4),n,K(2)) * hillA(X(2),n1,K(1));
         A(4) = X(3);
         A(5) = kd(1) * X(1);                                                 
         A(6) = X(2);
         A(7) = kd(2) * X(3);                    
         A(8) = X(4);
         % propensity cumulative total  
         asums = cumsum(A);
         
         % random selection of the next reaction time step and reaction occured
         r1 = rand(1);
         tau = log(1/r1)/asums(nreactions);
         r2 = rand(1);
         mu = find(r2*asums(nreactions)<asums,1);
         
         % if there is a delayed reaction scheduled, reject drawn reaction and update the delayed reaction insted
         pending = delayed_reaction(t,tau,schedule(:,1));
         
             
    if pending
        update_time = min(pending);
        nr = schedule(schedule(:,1)==update_time,2);
        h = find(schedule(:,1)==update_time);                     % row position for deleting the occured delayed reactions
        mu = nr;                                 % skiped the scheduled reaction when delayed occure           
        %mu(nr) = 1;
        % update the instant state vector 
        X = X + tm(:,mu);
        % update time to completion of delayed reactions 
        t = update_time;
        nr = [];
        % delete the delayed reactions after completion
        schedule = [schedule(1:h-1,:);schedule(h+1:end,:)];
    else
        if delay(mu)== 0
            X = X + tm(:,mu);
        else
            schedule = [schedule; [t+tau+delay(mu) mu]];
          
        end
        
        t = t + tau;
    end
    
    while ((nsaved + 1) <= numtosave) && (t > Tout(nsaved + 1))      % checking the condition for increasing fixed time interval
        nsaved = nsaved + 1;
        Nout(:,nsaved) = [X./v];                     % Storinfg the updated species value
    end
    step = step + 1;
    % store the necessary data
    t_out(step) = [t];
    y_out(:,step) = X./v;
    
    end
    
    if trajnum<= 100
    OS1(trajnum,:) = Nout(1,:);
    OS3(trajnum,:) = Nout(3,:);
    end
    
    
 %%
 
      %%%%%%%%% Computation of perioditicity and amplitude through FFT %%%%%%%%%%%%
 
%## FFT one sided
t = t_out;                                     % time vector 
L = length(t);
dt = (t(end-1)-t(1))/(L-1);                    % average sampling time
Fs = ceil(1/dt);                               % sampling frequency

% period and amplitude computation for oscillator Y1 & Y3

F = 0: Fs/L :Fs/2-Fs/L;                        % Frequency vector calculation

% data for Y1 & Y3
oscillator = [y_out(1,:); y_out(3,:)];

if WW == 1
for p = 1:2
% y1 = Z1 - mean(Z1);                          % Normalize signal
y = oscillator(p,:);                           % signal 
Y = fft(y,L);                                   % compute FFT
amp = (Y(1,(1:floor(L/2))))/(L/2);             % absolute valute of FFT
[v_amp, loc_amp] = max(amp);                   % amplitude value and its location
if p == 1
amplitude(1,trajnum,II) = v_amp ;                       % amplitude store
% period computation for oscillator 1
amp(1) = 0;                                   % delete the first element
[~, loc_period1] = max(amp);                    % detec period freq. position
period(1,trajnum,II) = 1/F(loc_period1);                 % period store

pha_period = 1/F(loc_period1);                 % for phase calculation

else
    
amplitude(2,trajnum,II) = v_amp ;
% period computation for oscillator 2
amp(1) = 0;                                   % delete the first element
[~, loc_period2] = max(amp);                    % detec period freq. position
period(2,trajnum,II) = 1/F(loc_period2);                 % period store

end
end
end

Phase = arbitrary_phase_shift(t_out,y_out,pha_period);

end

end
end
% """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
% storing necessary value

%save('data_stochastic_ACO.mat','period','amplitude','OS1','OS3','Tout','t_out','y_out','K1_new')


toc

