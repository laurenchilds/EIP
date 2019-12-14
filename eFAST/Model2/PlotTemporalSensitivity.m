clear all
close all
%%
% Individual Sensitivity Index
figure(2)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'Position',  [100, 100, 950, 1200])

% Total Sensitivity Index
figure(12)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'Position',  [200, 100, 950, 1200])
for j1 = 1:6
    if j1==1
        load('Model_efast_100_Model2.mat')
    elseif j1==2
        load('Model_efast_200_Model2.mat')
    elseif j1==3
        load('Model_efast_500_Model2.mat')
    elseif j1==4
        load('Model_efast_800_Model2.mat')
    elseif j1==5
        load('Model_efast_2000_Model2.mat')
    elseif j1==6
        load('Model_efast_4000_Model2.mat')
    end
        
% Individual Sensitivity Index
figure(2)
subplot(6,5,1+(j1-1)*5)
plot(Si(:,:,1)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==4
ylabel('                Proportion of Variation (S_i: individual sensitivitiy index)')
end
if j1==1
title('Ookinete density')
end
xlim([0 42])
ylim([0 1])

subplot(6,5,2+(j1-1)*5)
plot(Si(:,:,2)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Bursting oocysts')
end
xlim([0 42])
ylim([0 1])

subplot(6,5,3+(j1-1)*5)
plot(Si(:,:,3)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Non-bursting oocysts')
end
xlim([0 42])
ylim([0 1])

subplot(6,5,5+(j1-1)*5)
plot(Si(:,:,4)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Sporozoite count')
end
xlim([0 42])
ylim([0 1])


% Total Sensitivity Index
figure(12)
subplot(6,5,1+(j1-1)*5)
plot(Sti(:,:,1)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==4
ylabel('                 Proportion of Variation (S_{Ti}: Total sensitivity index)')
end
if j1==1
title('Ookinete density')
end
xlim([0 42])
ylim([0 1])

subplot(6,5,2+(j1-1)*5)
plot(Sti(:,:,2)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Bursting oocysts')
end
xlim([0 42])
ylim([0 1])

subplot(6,5,3+(j1-1)*5)
plot(Sti(:,:,3)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Non-bursting oocysts')
end
xlim([0 42])
ylim([0 1])

subplot(6,5,5+(j1-1)*5)
plot(Sti(:,:,4)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Sporozoite count')
end
xlim([0 42])
ylim([0 1])

% Individual Sensitivity Index
figure(2)
subplot(6,5,4+(j1-1)*5)
plot(Si(:,:,5)','linewidth',2)
hold on
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Total oocysts')
end
xlim([0 42])
ylim([0 1])


% Total Sensitivity Index
figure(12)
subplot(6,5,4+(j1-1)*5)
plot(Sti(:,:,5)','linewidth',2)
set(gca,'fontsize',14)
if j1==6
xlabel('Time, days')
end
if j1==1
title('Total oocysts')
end
xlim([0 42])
ylim([0 1])




end
%% LEGEND
figure(3)
plot(Sti(:,:,5)','linewidth',2)
l=legend(efast_var);
set(l,'box','off','Orientation','horizontal','fontsize',14)
ylim([1 2])
set(gca,'ytick','','xtick','')
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'Position',  [100, 100, 550, 50])
%%

%% EIP Sensitivity

SiALL = [];
StiALL = [];

for j1 = 1:6
    if j1==1
        load('Model_efast_100_Model2.mat')
    elseif j1==2
        load('Model_efast_200_Model2.mat')
    elseif j1==3
        load('Model_efast_500_Model2.mat')
    elseif j1==4
        load('Model_efast_800_Model2.mat')
    elseif j1==5
        load('Model_efast_2000_Model2.mat')
    elseif j1==6
        load('Model_efast_4000_Model2.mat')
    end


[Si,Sti,rangeSi,rangeSti] = efast_sd(Y1,OMi,MI,1,1);

SiALL =[SiALL Si];
StiALL =[StiALL Sti];
end
c = brewermap(6,'Oranges');
d = brewermap(6,'Blues');
figure(4)
hb=bar([SiALL zeros(7,1) StiALL]);
for c1 = 1:6
hb(c1).FaceColor = c(c1,:);
end
hb(7).FaceColor = 'w';
hb(7).EdgeColor = 'w';
for c1 = 8:13
hb(c1).FaceColor = d(c1-7,:);
hb(c1).FaceAlpha = 1;
end
set(gca,'fontsize',14)
set(gca,'xticklabel',efast_var)
xlabel('Time, days')
ylabel('Proportion of Variation')
title('EIP')
ylim([0 1])
l = legend('S_i, E(0) = 100','S_i, E(0) = 200','S_i, E(0) = 500','S_i, E(0) = 800','S_i, E(0) = 2000','S_i, E(0) = 4000','',...
    'S_{Ti}, E(0) = 100','S_{Ti}, E(0) = 200','S_{Ti}, E(0) = 500','S_{Ti}, E(0) = 800','S_{Ti}, E(0) = 2000','S_{Ti}, E(0) = 4000');
set(l,'box','off','location','northwest')
