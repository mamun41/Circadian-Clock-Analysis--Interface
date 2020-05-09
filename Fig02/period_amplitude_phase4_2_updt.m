function [period, amplitude,phase_shift] = period_amplitude_phase4_2_updt(t,y,t_step)

% error del: 0.1
%del = 1;
clear period 
clear amplitude
clear phase_shift 
clear phase1 
clear phase3 
clear phade_d
clear cut


Num_State = size(y,1);
period = zeros(Num_State,1);    % store period data
amplitude = zeros(Num_State,1); % store amplitude data
phase_shift = zeros(1,1);       % store phase difference data

% Theck the peak point 
cut = zeros(4,1);

for m = 1:Num_State

 clear p
% returns the indices and peaks position(locs_maxima), width(w) and Height(p)
[pks_maxima, locs_maxima, ~, p]= findpeaks(y(m,(end-200/t_step:end)),t(end-200/t_step:end),'MinPeakDistance',10);

% No need to cal culate 
%[pks_minima, locs_minima]= findpeaks(-sol.y(m,:),sol.x);

% detecting cut peak for calculation
 %cut(m,:) = length(Mintab);
 cut(m,:) = length(pks_maxima);


% check the number of peak point s.t morthan 2 for calculationg period
if cut(m,:)>2
    
% computation of perioditicity
%Period = abs(diff(Mintab(:,1)));
Period = abs(diff(locs_maxima));
period(m,:) = Period(end-1);

% determine the minimum length
%L= min([length(Maxtab(:,1)),length(Mintab(:,1))]);
%L = min([length(pks_maxima), length(pks_minima)]);
% computation of amplitude
%Amplitude = abs(Maxtab(1:L,2)-Mintab(1:L,2));
Amplitude = p;
amplitude(m,:) = Amplitude(end-1);

if m==1 
   
    %phase1 = locs_maxima(:,1);
    phase1 = locs_maxima;
    
end
if m==3
    
    %phase3= Mintab(:,1);
    phase3 = locs_maxima;
   
end
% since dde23 generates numerical error
% here we consider 0.2 tolerance
%
if m==4
    if abs(period(1,1)-period(3,1))<=0.2
    n_period = min([period(1,1), period(3,1)]);
    period(1,1)=n_period;
    period(3,1)=n_period;
    end
end
%}

else
    period(m,:)=0;
    
    amplitude(m,:)= 0;
       
end

end

% check cut peak point length
cut_phase = min([cut(1,:), cut(3,:)]);
if cut_phase>2
for i = 1:1:cut_phase
phase_d(i) = abs(phase1(i)-phase3(i))/period(1,1);
if phase_d(i)>0.5
    phase_d(i) = abs(1-phase_d(i));
end
end
phase_shift(1) = phase_d(end-1);
else
     phase_shift(1)= 0; 
end

%plot(phase_d,'linewidth',3)





