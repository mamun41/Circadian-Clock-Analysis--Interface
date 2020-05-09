% Combined Results and figures with molecular Noise for ACO MODEL
% Actually this result is based on Stochastic simulations by Gilespi
% Algorithms

clear all
% Load the stored data
load('data_stochastic_ACO.mat')
clear t_out
clear y_out
load('Tdata_for_ACO.mat')

% For Period Data
for zz = 1:1:length(K1_intensity)
    % // K2 = 1
    Period_mean(zz,:) = mean(period(:,:,zz)');
    Period_SD(zz,:) = std(period(:,:,zz)');
    CV_Period(zz,:) = (std(period(:,:,zz)')./mean(period(:,:,zz)'))*100;
    
    % consider the mnimized error
    for i = 1:1:size(Period_mean,1)
    clear del_B
    del_B = abs(Period_mean(i,1)-Period_mean(i,2));
    
    if del_B <= 0.2        % tolarance of numerical error = 0.2 h
    Period_mean(i,1) = min([Period_mean(i,1),Period_mean(i,2)]);
    Period_mean(i,2) = min([Period_mean(i,1),Period_mean(i,2)]);
    else
    Period_mean(i,1) = Period_mean(i,1);
    Period_mean(i,2) = Period_mean(i,2);
    end
    end
       
    
    % // K2 = 2
    Period_mean2(zz,:) = mean(period_2(:,:,zz)');
    Period_SD2(zz,:) = std(period_2(:,:,zz)');
    CV_Period2(zz,:) = (std(period_2(:,:,zz)')./mean(period(:,:,zz)'))*100;
    % // K2 = 3
    Period_mean3(zz,:) = mean(period_3(:,:,zz)');
    Period_SD3(zz,:) = std(period_3(:,:,zz)');
    CV_Period3(zz,:) = (std(period_3(:,:,zz)')./mean(period(:,:,zz)'))*100;
end


% For Amplitude Data
for zz = 1:1:length(K1_intensity)
    
    % // K2 = 1
    Amp_mean(zz,:) = mean(amplitude(:,:,zz)');
    Amp_SD(zz,:) = std(amplitude(:,:,zz)');
    CV_Amp(zz,:) = (std(amplitude(:,:,zz)')./mean(amplitude(:,:,zz)'))*100;
    
    % // K2 = 2
    Amp_mean2(zz,:) = mean(amplitude_2(:,:,zz)');
    Amp_SD2(zz,:) = std(amplitude_2(:,:,zz)');
    CV_Amp2(zz,:) = (std(amplitude_2(:,:,zz)')./mean(amplitude(:,:,zz)'))*100;
    
    % // K2 = 3
    Amp_mean3(zz,:) = mean(amplitude_3(:,:,zz)');
    Amp_SD3(zz,:) = std(amplitude_3(:,:,zz)');
    CV_Amp3(zz,:) = (std(amplitude_3(:,:,zz)')./mean(amplitude(:,:,zz)'))*100;
end

% for ACO model
%
figure
subplot(3,2,1)
hold on 
box on
plot(t_out,y_out(1,:),'r','linewidth',3)               
plot(t_out,y_out(3,:),'g','linewidth',3)             
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[0 300],'Xtick',[0 150 300],'Ylim',[0 30],'Ytick',[0 15 30]);
xlabel('Time','fontname','arial','fontsize',14);
ylabel('Concentration(a.u.)','fontname','arial','fontsize',14);
str2 = 'A'; text(0,34,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


subplot(3,2,3)
hold on 
box on
% K2 = 1
plot(K1_intensity,smooth(Period_mean(:,1)),'-r','linewidth',4)               
plot(K1_intensity,smooth(Period_mean(:,2)),'-g','linewidth',4)
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[0.01 4],'Xtick',[0.01 1 2 3 4],'Ylim',[24 30],'Ytick',[24 26 28 30]);
xlabel('K_1','fontname','arial','fontsize',14);
ylabel('Mean period','fontname','arial','fontsize',14);
str2 = 'B'; text(0,30.7,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


subplot(3,2,5)
hold on 
box on
% K2 = 1
plot(K1_intensity,Amp_mean(:,1),'-r','linewidth',4)             
plot(K1_intensity,Amp_mean(:,2),'-g','linewidth',4)  

set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[0.01 4],'Xtick',[0.01 1 2 3 4],'Ylim',[4 13],'Ytick',[4 7 10 13]);
xlabel('K_1','fontname','arial','fontsize',14);
ylabel('Mean amplitude','fontname','arial','fontsize',14);
str2 = 'C'; text(0,13.4,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


%%%%////////////////////////   --RCO--   //////////////////////////%%%%%
% Load the stor data
load('data_stochastic_RCO.mat')
clear t_out
clear y_out
%load('RCO_timecourse.mat')
load('Tdata_for_RCO.mat')

% For Period Data
for zz = 1:1:length(K1_intensity)
    % // K2 = 1
    Period_mean(zz,:) = mean(period(:,:,zz)');
    Period_SD(zz,:) = std(period(:,:,zz)');
    CV_Period(zz,:) = (std(period(:,:,zz)')./mean(period(:,:,zz)'))*100;
    
    
    % consider the mnimized error
    for i = 1:1:size(Period_mean,1)
    clear del_B
    del_B = abs(Period_mean(i,1)-Period_mean(i,2));
    
    if del_B <= 0.2        % tolarance of numerical error = 0.2 h
    Period_mean(i,1) = min([Period_mean(i,1),Period_mean(i,2)]);
    Period_mean(i,2) = min([Period_mean(i,1),Period_mean(i,2)]);
    else
    Period_mean(i,1) = Period_mean(i,1);
    Period_mean(i,2) = Period_mean(i,2);
    end
    end
    
    
    % // K2 = 2
    Period_mean2(zz,:) = mean(period_2(:,:,zz)');
    Period_SD2(zz,:) = std(period_2(:,:,zz)');
    CV_Period2(zz,:) = (std(period_2(:,:,zz)')./mean(period(:,:,zz)'))*100;
    % // K2 = 3
    Period_mean3(zz,:) = mean(period_3(:,:,zz)');
    Period_SD3(zz,:) = std(period_3(:,:,zz)');
    CV_Period3(zz,:) = (std(period_3(:,:,zz)')./mean(period(:,:,zz)'))*100;
end


% For Period Data
for zz = 1:1:length(K1_intensity)
    
    % // K2 = 1
    Amp_mean(zz,:) = mean(amplitude(:,:,zz)');
    Amp_SD(zz,:) = std(amplitude(:,:,zz)');
    CV_Amp(zz,:) = (std(amplitude(:,:,zz)')./mean(amplitude(:,:,zz)'))*100;
    
    % // K2 = 2
    Amp_mean2(zz,:) = mean(amplitude_2(:,:,zz)');
    Amp_SD2(zz,:) = std(amplitude_2(:,:,zz)');
    CV_Amp2(zz,:) = (std(amplitude_2(:,:,zz)')./mean(amplitude(:,:,zz)'))*100;
    
    % // K2 = 3
    Amp_mean3(zz,:) = mean(amplitude_3(:,:,zz)');
    Amp_SD3(zz,:) = std(amplitude_3(:,:,zz)');
    CV_Amp3(zz,:) = (std(amplitude_3(:,:,zz)')./mean(amplitude(:,:,zz)'))*100;
end

% for RCO model
%
subplot(3,2,2)
hold on
box on
plot(t_out,y_out(1,:),'r','linewidth',3)               % no. 11,37**
plot(t_out,y_out(2,:),'g','linewidth',3) 
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[0 300],'Xtick',[0 150 300],'Ylim',[0 30],'Ytick',[0 15 30]);
xlabel('Time','fontname','arial','fontsize',14);
ylabel('Concentration(a.u.)','fontname','arial','fontsize',14);
str2 = 'D'; text(0,34,str2,'Fontsize',18,'fontweight','bold','fontname','arial');
legend('Y_1','Y_3')


subplot(3,2,4)
hold on 
box on
% K2 = 1
plot(K1_intensity,smooth(Period_mean(:,1)),'-r','linewidth',4)               
plot(K1_intensity,smooth(Period_mean(:,2)),'-g','linewidth',4)
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[0.01 4],'Xtick',[0.01 1 2 3 4],'Ylim',[24 30],'Ytick',[24 26 28 30]);
xlabel('K_1','fontname','arial','fontsize',14);
ylabel('Mean period','fontname','arial','fontsize',14);
str2 = 'E'; text(0,30.7,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


subplot(3,2,6)
hold on 
box on
% K2 = 1
plot(K1_intensity,Amp_mean(:,1),'-r','linewidth',4)             
plot(K1_intensity,Amp_mean(:,2),'-g','linewidth',4)  

set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[0.01 4],'Xtick',[0.01 1 2 3 4],'Ylim',[4 13],'Ytick',[4 7 10 13]);
xlabel('K_1','fontname','arial','fontsize',14);
ylabel('Mean amplitude','fontname','arial','fontsize',14);
str2 = 'F'; text(0,13.4,str2,'Fontsize',18,'fontweight','bold','fontname','arial');
%}



