% thse code will make some figure for phase, period and pamplitude
clear

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   This code produce the figure from random perterbations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
% Figure #6     K1, CD, vs Parameters: period, amplitude, phase
%%%%%%%%%%%%%%%%%%%%%%%%     ACO   :  3D: random variations
% load ACO Random variation data
load('data_externalNoise_ACO.mat')
%%%%%%%%%%%%%  Arrange the period matrix data   %%%%%%%%%%%%
% For K(2) = 1
PP = permute(P_stor_1_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
PP_1 = PP(:,:,1);      % first oscillator(Y1)
PP_2 = PP(:,:,3);      % second oscillator(Y3)

%for K(2) = 2
PP1 = permute(P_stor_5_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
PP1_1 = PP1(:,:,1);      % first oscillator(Y1)
PP1_2 = PP1(:,:,3);      % second oscillator(Y3)
%}
% for K(2) = 3
PP2 = permute(P_stor_10_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
PP2_1 = PP2(:,:,1);      % first oscillator(Y1)
PP2_2 = PP2(:,:,3);      % second oscillator(Y3)

Mean_period = [mean(PP_1)' mean(PP_2)'  mean(PP1_1)' mean(PP1_2)'  mean(PP2_1)' mean(PP2_2)'];
SD_period = [std(PP_1)' std(PP_2)'  std(PP1_1)' std(PP1_2)'  std(PP2_1)' std(PP2_2)'];
CV_period = 100*(SD_period./Mean_period);


%%%%%%%%%%%%%%%%%%   AMP        %%%%%%%%%%%%%%%%%%%%%%%%%%%
% aggange the amplitude matrix data 
%for K(2)= 1
%
AA = permute(A_stor_1_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
AA_1 = AA(:,:,1);      % first oscillator(Y1)
AA_2 = AA(:,:,3);      % second oscillator(Y3)


%for K(2)= 2
AA1 = permute(A_stor_5_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
AA1_1 = AA1(:,:,1);      % first oscillator(Y1)
AA1_2 = AA1(:,:,3);      % second oscillator(Y3)

%}
%for K(2)= 3
AA2 = permute(A_stor_10_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
AA2_1 = AA2(:,:,1);      % first oscillator(Y1)
AA2_2 = AA2(:,:,3);      % second oscillator(Y3)


Mean_amp = [mean(AA_1)' mean(AA_2)'  mean(AA1_1)' mean(AA1_2)'  mean(AA2_1)' mean(AA2_2)'];
SD_amp = [std(AA_1)' std(AA_2)'  std(AA1_1)' std(AA1_2)'  std(AA2_1)' std(AA2_2)'];
CV_amp = 100*(SD_amp./Mean_amp);


% figure for phase

for qq = 1:1:3
    if qq ==1   % for K2 = 1
        val_1 = abs(Ph_stor_1_percent');
        %
    elseif qq == 2    % for K2 = 2
        val_1 = abs(Ph_stor_5_percent');
    elseif qq == 3    % for K2 = 3
        val_1 = abs(Ph_stor_10_percent');
        %}
    end
    
    for ii = 1:1:size(val_1,2)
        temp = val_1(:,ii);
        % delite the outlier
        val_1F(ii,qq) = mean(temp(val_1(:,ii)<=.5));
        SD_Ph(ii,qq) = std(temp(val_1(:,ii)<=.5));
        CV_Ph(ii,qq) = 100*(SD_Ph(ii,qq)/val_1F(ii,qq));
        
    end
    
end


figure(6)
subplot(3,2,3)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(Mean_period(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(Mean_period(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
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
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(Mean_amp(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(Mean_amp(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
set (gca,'XDir','reverse')
%set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 12],'Ztick',[0 2 4 6 8 10 12]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Amplitude[a.u.]','fontname','arial','fontsize',12);
str2 = 'C'; text(.1,.01,15,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,1)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(val_1F(:,3)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(val_1F(:,3)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 0.6],'Ztick',[0 .1 .2 .30 .4 .5 .6]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Phase-difference[h]','fontname','arial','fontsize',12);
str2 = 'A'; text(.1,.01,.8,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



%#####################   Fig: 07-ACO: checking the robustness result using
%random perturbations SD results   #######################  %%%%%%
figure(7)
subplot(3,2,3)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(SD_period(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(SD_period(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 5],'Ztick',[0 1 2 3 4 5]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('SD of Period [h]','fontname','arial','fontsize',12);
str2 = 'B'; text(.1,.01,6,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,5)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(SD_amp(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(SD_amp(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 2],'Ztick',[0 .5 1 1.5 2]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('SD of Amplitude [a.u.]','fontname','arial','fontsize',12);
str2 = 'C'; text(.1,.01,2.5,str2,'Fontsize',18,'fontweight','bold','fontname','arial');




subplot(3,2,1)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(SD_Ph(:,3)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(SD_Ph(:,3)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 0.3],'Ztick',[0 .1 .2 .30]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('SD of Phase-diff. [h]','fontname','arial','fontsize',12);
str2 = 'A'; text(.1,.01,.4,str2,'Fontsize',18,'fontweight','bold','fontname','arial');




clear
%%    %%%%%%%%%%%%%%%%%%%  RCO   %%%%%%%%%%%%%%%%%%%%%%%
% load RCO Random variation data
load('data_externalNoise_RCO.mat')
%%%%%%%%%%%%    arrange the period matrix data  %%%%%%%%%%%%%

% For K(2) = 1
PP = permute(P_stor_1_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
PP_1 = PP(:,:,1);      % first oscillator(Y1)
PP_2 = PP(:,:,3);      % second oscillator(Y3)

%for K(2) = 2
PP1 = permute(P_stor_5_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
PP1_1 = PP1(:,:,1);      % first oscillator(Y1)
PP1_2 = PP1(:,:,3);      % second oscillator(Y3)
%}
% for K(2) = 3
PP2 = permute(P_stor_10_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
PP2_1 = PP2(:,:,1);      % first oscillator(Y1)
PP2_2 = PP2(:,:,3);      % second oscillator(Y3)

Mean_period = [mean(PP_1)' mean(PP_2)'  mean(PP1_1)' mean(PP1_2)'  mean(PP2_1)' mean(PP2_2)'];
SD_period = [std(PP_1)' std(PP_2)'  std(PP1_1)' std(PP1_2)'  std(PP2_1)' std(PP2_2)'];
CV_period = 100*(SD_period./Mean_period);


%%%%%%%%%%%%%%%%%%   AMP        %%%%%%%%%%%%%%%%%%%%%%%%%%%
% aggange the amplitude matrix data 
%for K(2)= 1
%
AA = permute(A_stor_1_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
AA_1 = AA(:,:,1);      % first oscillator(Y1)
AA_2 = AA(:,:,3);      % second oscillator(Y3)


%for K(2)= 2
AA1 = permute(A_stor_5_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
AA1_1 = AA1(:,:,1);      % first oscillator(Y1)
AA1_2 = AA1(:,:,3);      % second oscillator(Y3)

%}
%for K(2)= 3
AA2 = permute(A_stor_10_percent,([2,3,1]));
% Seperate the "first oscillator" and "second oscillator"" period data
AA2_1 = AA2(:,:,1);      % first oscillator(Y1)
AA2_2 = AA2(:,:,3);      % second oscillator(Y3)


Mean_amp = [mean(AA_1)' mean(AA_2)'  mean(AA1_1)' mean(AA1_2)'  mean(AA2_1)' mean(AA2_2)'];
SD_amp = [std(AA_1)' std(AA_2)'  std(AA1_1)' std(AA1_2)'  std(AA2_1)' std(AA2_2)'];
CV_amp = 100*(SD_amp./Mean_amp);


% figure for phase

for qq = 1:1:3
    if qq ==1   % for K2 = 1
        val_1 = abs(Ph_stor_1_percent');
        %
    elseif qq == 2    % for K2 = 2
        val_1 = abs(Ph_stor_5_percent');
    elseif qq == 3    % for K2 = 3
        val_1 = abs(Ph_stor_10_percent');
        %}
    end
    
    for ii = 1:1:size(val_1,2)
        temp = val_1(:,ii);
        % delite the outlier
        val_1F(ii,qq) = mean(temp(val_1(:,ii)<=.5));
        SD_Ph(ii,qq) = std(temp(val_1(:,ii)<=.5));
        CV_Ph(ii,qq) = 100*(SD_Ph(ii,qq)/val_1F(ii,qq));
        
    end
    
end


figure(6)     %   RCO
subplot(3,2,4)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(Mean_period(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(Mean_period(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
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
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(Mean_amp(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(Mean_amp(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
set (gca,'XDir','reverse')
%set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 12],'Ztick',[0 2 4 6 8 10 12]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Amplitude [a.u.]','fontname','arial','fontsize',12);
str2 = 'F'; text(.1,.01,15,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,2)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(val_1F(:,3)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(val_1F(:,3)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 0.6],'Ztick',[0 .1 .2 .30 .4 .5 .6]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('Phase-difference [h]','fontname','arial','fontsize',12);
str2 = 'D'; text(.1,.01,.8,str2,'Fontsize',18,'fontweight','bold','fontname','arial');


%#####################   Fig: 07-RCO: checking the robustness result using
%random perturbations  : SD resullt   #######################  %%%%%%
figure(7)
subplot(3,2,4)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(SD_period(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(SD_period(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 5],'Ztick',[0 1 2 3 4 5]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('SD of Period [h]','fontname','arial','fontsize',12);
str2 = 'E'; text(.1,.01,6,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



subplot(3,2,6)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(SD_amp(:,5)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(SD_amp(:,5)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 2],'Ztick',[0 .5 1 1.5 2]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('SD of Amplitude [a.u.]','fontname','arial','fontsize',12);
str2 = 'F'; text(.1,.01,2.5,str2,'Fontsize',18,'fontweight','bold','fontname','arial');




subplot(3,2,2)
X=[linspace(1,0,200)'*K1_intensity];
mesh(repmat(New_CD,size(X,1),1),X,repmat(SD_Ph(:,3)',size(X,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
hold on
Y=[linspace(1,0,200)'*New_CD];
mesh(Y,repmat(K1_intensity,size(Y,1),1),repmat(SD_Ph(:,3)',size(Y,1),1))%,'FaceColor','r', 'FaceAlpha',1, 'EdgeColor','none')
%set (gca,'XDir','reverse')
set (gca,'YDir','reverse')
grid on
set(gca,'fontname','arial','fontsize',10,'fontweight','bold','linewidth',1.2,'Ylim',[0.01 4],...
    'Ytick',[0.01 1 2 3 4],'Xlim',[0.1 20],'Xtick',[.1 5 10 15 20],'Zlim',[0 0.3],'Ztick',[0 .1 .2 .30]);
ylabel('K_C','fontname','arial','fontsize',12);
xlabel('\tauc [h]','fontname','arial','fontsize',12,'Rotation',0);
zlabel('SD of Phase-diff. [h]','fontname','arial','fontsize',12);
str2 = 'D'; text(.1,.01,.4,str2,'Fontsize',18,'fontweight','bold','fontname','arial');



