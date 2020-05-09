% ////////////////   ACO model   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc

% load the necessary ACO data set
load('data_phase_ACO.mat')

figure

subplot (221)
plot(Asymmetry_kd1,abs(Pd),'m','linewidth',6);
hold on;
xlabel('kd_1','fontname','arial','fontsize',12);
ylabel('Phase difference','fontname','arial','fontsize',12);
set(gca,'fontname','arial','fontsize',11,'fontweight','bold','linewidth',1.2,'Xlim',[0.90 1.50],'Xtick',[0.9 1 1.15 1.25 1.40 1.5],'Ylim',[0 0.6],'Ytick',[0 .1 .2 0.30 .4 .5 0.60])
title('ACO','fontname','arial','fontweight','bold','fontsize',16)
str2 = 'A'; text(.9,.7,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot (223)
plot(sol.x,sol.y(1,:),'r','linewidth',4);
hold on;
plot(sol.x,sol.y(3,:),'g','linewidth',3);
xlabel('Time(h)','fontname','arial','fontsize',12);
ylabel('Concentration (a.u.)','fontname','arial','fontsize',12);
set(gca,'fontname','arial','fontsize',11,'fontweight','bold','linewidth',1.2,'Xlim',[0 300],'Xtick',[0 100 200 300],'Ylim',[0 14],'Ytick',[0 4 9 14])
str2 = 'B'; text(0,16,str2,'Fontsize',18,'fontweight','bold','fontname','arial');
legend('Y_1','Y_3')


%////////////////  RCO model ////////////////

clear all

% load the necessary ACO data set
load('data_phase_RCO.mat')

subplot (222)
plot(Asymmetry_kd1,abs(Pd),'m','linewidth',6);
hold on;
xlabel('kd_1','fontname','arial','fontsize',12);
ylabel('Phase difference','fontname','arial','fontsize',12);
set(gca,'fontname','arial','fontsize',11,'fontweight','bold','linewidth',1.2,'Xlim',[1.10 1.60],'Xtick',[1.10 1.20 1.30 1.40 1.50 1.60],'Ylim',[0 0.6],'Ytick',[0 .1 .2 0.30 .4 .5 0.60])
title('RCO','fontname','arial','fontweight','bold','fontsize',16)
str2 = 'C'; text(1.1,.7,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


subplot (224)
plot(sol.x,sol.y(1,:),'r','linewidth',4);
hold on;
plot(sol.x,sol.y(3,:),'g','linewidth',3);
xlabel('Time(h)','fontname','arial','fontsize',12);
ylabel('Concentration (a.u.)','fontname','arial','fontsize',12);
set(gca,'fontname','arial','fontsize',11,'fontweight','bold','linewidth',1.2,'Xlim',[0 300],'Xtick',[0 100 200 300],'Ylim',[0 14],'Ytick',[0 4 9 14])
str2 = 'D'; text(0,16,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


