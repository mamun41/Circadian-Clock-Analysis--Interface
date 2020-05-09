% This file compute the correlation between the Entrained oscillator
% Here we use the build in matLab command 'corr(x,y)'
% x = oscillator Y1 & 
% y = oscillatir Y3

clear all
% load ACO data
load('UP_6_ACO_entrainment_K2_1_subtle_5000_used0=2CHACKED.mat')

corr(entrain_02_period(2,:,1)',entrain_02_period(1,:,1)')
corr(entrain_02_period(2,:,4)',entrain_02_period(1,:,4)')
corr(entrain_02_period(2,:,10)',entrain_02_period(1,:,10)')
corr(entrain_02_period(2,:,18)',entrain_02_period(1,:,18)')




clear all
% load RCO data
load('UP_6_RCO_entrainment_K2_1_subtle_5000_used0=2CHECKED.mat')
corr(entrain_02_period(2,:,1)',entrain_02_period(1,:,1)')
corr(entrain_02_period(2,:,4)',entrain_02_period(1,:,4)')
corr(entrain_02_period(2,:,10)',entrain_02_period(1,:,10)')
corr(entrain_02_period(2,:,18)',entrain_02_period(1,:,18)')


