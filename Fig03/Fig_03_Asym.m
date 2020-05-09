% These code will make some figure for phase, period and pamplitude
clear
%%   !!!!!!!!!!!!!!!!!!!!!!!  ACO : 3D>> K1 vs CD vs Parameter    !!!!!!!!!!!!!!!!!!!!!
figure(3)     % Figure #3
%%%%%%%%%%%%%%%%%%%%%%%%
% here only vary the K1 & CD parameter
% figure of "Phase"
subplot(3,2,1)
load('data_Asym_ACO.mat')
z=[linspace(1,0,200)'*K1_new];
mesh(repmat(delayNew,size(z,1),1),z,repmat(phase_dif,size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')

hold on
z=[linspace(1,0,200)'*delayNew];
mesh(z,repmat(K1_new,size(z,1),1),repmat(phase_dif,size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 0.6],'Ztick',[0 .1 .2 .30 .4 .5 .6]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Phase-difference [h]','fontname','arial','fontsize',12);
str2 = 'A'; text(.1,.01,.8,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,3)
% figure of "Period"
load('data_Asym_ACO.mat')
z=[linspace(1,0,200)'*K1_new];
mesh(repmat(delayNew,size(z,1),1),z,repmat(period(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')

hold on
z=[linspace(1,0,200)'*delayNew];
mesh(z,repmat(K1_new,size(z,1),1),repmat(period(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 40],'Ztick',[0 5 10 15 20 25 30 35 40]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Period [h]','fontname','arial','fontsize',12);
str2 = 'B'; text(.1,.01,50,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,5)
% figure of "Amplitude"
load('data_Asym_ACO.mat')
z=[linspace(1,0,200)'*K1_new];
mesh(repmat(delayNew,size(z,1),1),z,repmat(amplitude(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')

hold on
z=[linspace(1,0,200)'*delayNew];
mesh(z,repmat(K1_new,size(z,1),1),repmat(amplitude(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 12],'Ztick',[0 2 4 6 8 10 12]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Amplitude [a.u.]','fontname','arial','fontsize',12);
str2 = 'C'; text(.1,.01,15,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



clear

%%    %%%%%%%%%%%%%%%%  RCO: 3D>> K1,CD vs Parameters %%%%%%%%%%%%%%%%%%%%%%

figure(3)
subplot(3,2,2)
load('data_Asym_RCO.mat')
z=[linspace(1,0,200)'*K1_new];
mesh(repmat(delayNew,size(z,1),1),z,repmat(phase_dif,size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')

hold on
z=[linspace(1,0,200)'*delayNew];
mesh(z,repmat(K1_new,size(z,1),1),repmat(phase_dif,size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 0.6],'Ztick',[0 .1 .2 .30 .4 .5 .6]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Phase-difference [h]','fontname','arial','fontsize',12);
str2 = 'D'; text(.1,.01,.8,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,4)
% figure of "Period"
load('data_Asym_RCO.mat')
z=[linspace(1,0,200)'*K1_new];
mesh(repmat(delayNew,size(z,1),1),z,repmat(period(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')

hold on
z=[linspace(1,0,200)'*delayNew];
mesh(z,repmat(K1_new,size(z,1),1),repmat(period(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 40],'Ztick',[0 5 10 15 20 25 30 35 40]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Period [h]','fontname','arial','fontsize',12);
str2 = 'E'; text(.1,.01,50,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,6)
% figure of "Amplitude"
load('data_Asym_RCO.mat')
z=[linspace(1,0,200)'*K1_new];
mesh(repmat(delayNew,size(z,1),1),z,repmat(amplitude(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')

hold on
z=[linspace(1,0,200)'*delayNew];
mesh(z,repmat(K1_new,size(z,1),1),repmat(amplitude(1,:),size(z,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 12],'Ztick',[0 2 4 6 8 10 12]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Amplitude [a.u.]','fontname','arial','fontsize',12);
str2 = 'F'; text(.1,.01,15,str2,'Fontsize',18,'fontweight','bold','fontname','arial');




