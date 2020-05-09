% figure for publications of entrainability Analysis
% Necessary Figures
% Fixed the minimum figures

clear all

figure
% ACO fig
% load data
load('data_ACO_Entrainment.mat')

% entrained Figures for period: Master clock vs Entrained oscillator
subplot(4,2,1)
plot(entrain_02_period(3,:,1),entrain_02_period(1,:,1),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,1),entrain_02_period(2,:,1),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
title('ACO','fontname','arial','fontweight','bold','fontsize',16);
box on; legend('Y_1','Y_3')
str1 = 'A';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')



subplot(4,2,3)
plot(entrain_02_period(3,:,4),entrain_02_period(1,:,4),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,4),entrain_02_period(2,:,4),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
%title('ACO','fontname','arial','fontweight','bold','fontsize',14);
box on;
str1 = 'B';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')


subplot(4,2,5)
plot(entrain_02_period(3,:,10),entrain_02_period(1,:,10),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,10),entrain_02_period(2,:,10),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
%title('ACO','fontname','arial','fontweight','bold','fontsize',14);
box on;
str1 = 'C';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')


subplot(4,2,7)
plot(entrain_02_period(3,:,18),entrain_02_period(1,:,18),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,18),entrain_02_period(2,:,18),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
%title('ACO','fontname','arial','fontweight','bold','fontsize',14);
box on;
str1 = 'D';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')


%% 
clc
clear all
% RCO fig
% load data

load('data_RCO_Entrainment.mat')

% entrained Figures for period: Master clock vs Entrained oscillator

subplot(4,2,2)
plot(entrain_02_period(3,:,1),entrain_02_period(1,:,1),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,1),entrain_02_period(2,:,1),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
title('RCO','fontname','arial','fontweight','bold','fontsize',16);
box on;
str1 = 'E';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')



subplot(4,2,4)
plot(entrain_02_period(3,:,4),entrain_02_period(1,:,4),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,4),entrain_02_period(2,:,4),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
%title('ACO','fontname','arial','fontweight','bold','fontsize',14);
box on;
str1 = 'F';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')



subplot(4,2,6)
plot(entrain_02_period(3,:,10),entrain_02_period(1,:,10),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,10),entrain_02_period(2,:,10),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],...
    'Xtick',[21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
%title('ACO','fontname','arial','fontweight','bold','fontsize',14);
box on;
str1 = 'G';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')


subplot(4,2,8)
plot(entrain_02_period(3,:,18),entrain_02_period(1,:,18),'^r','linewidth',1.5); 
hold on
plot(entrain_02_period(3,:,18),entrain_02_period(2,:,18),'og','linewidth',1.5)
%legend('Oscillator1: Y_1','Oscillator2: Y_3')
set(gca,'fontname','arial','fontsize',12,'fontweight','bold','linewidth',1.2,'XLim',[21 32],'Xtick',...
    [21 24 27 29 32],'Ylim',[21 32],'Ytick',[21 24 27 29 32],'XMinorTick','on','YMinorTick','on');
xlabel('Master Clock','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Entrained Clock','fontname','arial','fontweight','bold','fontsize',12);
%title('ACO','fontname','arial','fontweight','bold','fontsize',14);
box on;
str1 = 'H';text(20,33.8,str1,'Fontsize',17,'fontweight','bold','fontname','arial')


