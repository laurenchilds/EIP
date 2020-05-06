
clear
close all


load('BestModelOutput.mat')
M1 = BestModel1params;
M2 = Model2params;
load('EIPSummary.mat')
M3 = EIP_BestModel1_Gam;
N = BestModel1';

% sigmaE muE f tb k mu0
chain = {'c1','c2','c3','c4','c5'};
expt = {'G','AD','H','BE','I','CF'};
jit = -0.25;
for j = 1:6
burnin = 50001;
sigE = [];
muE = [];
f = [];
tb = [];
k = [];
muO = [];

for j2 = 1:5
    if j ==6 || j==4
        burnin = 150001;
        fname = strcat('Exp',expt(j),'_',chain(j2),'.mat');
    else
        fname = strcat('Exp',expt(j),'_',chain(j2),'.mat');
    end
load(fname{1})
sigE = [sigE; param(burnin:end,1)];
muE = [muE; param(burnin:end,2)];
f = [f; param(burnin:end,3)];
tb = [tb; param(burnin:end,4)];
k = [k; param(burnin:end,5)];
muO = [muO; param(burnin:end,6)];
end
tstar = log((2.^(1./k)).*(1+exp(tb))-exp(tb));

Ttstar(:,j) = tstar;
EIP(:,j) = 1./(muE+sigE) + tstar;
TsigE(:,j)= sigE;
TmuE(:,j) = muE;
Tf(:,j) = f;
Ttb(:,j) = tb;
Tk(:,j) = k;
TmuO(:,j) = muO;
end

%% Plot tstar
figure(3)
violin(Ttstar,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M2(:,7),'r*')
plot(1:6,M3'-1./(sum(M1(:,1:2),2)),'bo')
hold off
set(gca,'fontsize',14)
set(gca,'xticklabel',[100 200 500 800 2000 4000])
set(gca,'ytick',14:2:26)
ylim([14 26])
xlabel('Initial ookinete density')
ylabel('t*')

%% Plot 1 / (muE + sigmaE)
figure(4)
violin(EIP-Ttstar,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,1./(sum(M1(:,1:2),2)),'bo')
plot(1:6,1./(sum(M2(:,1:2),2)),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'xticklabel',[100 200 500 800 2000 4000])
ylim([0 2])
xlabel('Initial ookinete density')
ylabel('1/(\mu_E+\sigma_E)')

%% Plot EIP
figure(1)
violin(EIP,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,1./(sum(M2(:,1:2),2))+ M2(:,7),'r*')
plot(1:6,M3(:),'bo')
hold off
set(gca,'fontsize',14)
set(gca,'xticklabel',[100 200 500 800 2000 4000])
set(gca,'ytick',16:2:26)
ylim([16 26])
xlabel('Initial ookinete density')
ylabel('EIP (days)')
hold on

%% Plot Parameter posterior distributions
figure(2);
clf
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'Position',  [100, 100, 700, 1000])

subplot(3,2,1)
violin(TsigE,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M1(:,1),'bo')
plot(1:6,M2(:,1),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'ytick',0:2)
set(gca,'xtick',1:6,'xticklabel',[100 200 500 800 2000 4000])
ylabel('\sigma_E')
ylim([0 2])

subplot(3,2,2)
violin(TmuE,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M1(:,2),'bo')
plot(1:6,M2(:,2),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'ytick',0:2)
set(gca,'xtick',1:6,'xticklabel',[100 200 500 800 2000 4000])
ylabel('\mu_E')
ylim([0 2])

subplot(3,2,3)
violin(Tf,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M1(:,5),'bo')
plot(1:6,M2(:,5),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'ytick',0:.05:.1)
set(gca,'xtick',1:6,'xticklabel',[100 200 500 800 2000 4000])
ylabel('f')
ylim([0 .1])

subplot(3,2,4)
violin(TmuO,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M1(:,3),'bo')
plot(1:6,M2(:,3),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'ytick',0:.05:.1)
set(gca,'xtick',1:6,'xticklabel',[100 200 500 800 2000 4000])
ylabel('\mu_O')
ylim([0 .1])

subplot(3,2,5)
violin(Ttb,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M1(:,6),'bo')
plot(1:6,M2(:,6),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'xtick',1:6,'xticklabel',[100 200 500 800 2000 4000])
ylabel('t_b')
ylim([12 24])
xlabel('Initial ookinete density')

subplot(3,2,6)
violin(Tk,'mc','','medc','k','facecolor','red');
hold on
plot(1:6,M2(:,4),'r*')
hold off
set(gca,'fontsize',14)
set(gca,'xtick',1:6,'xticklabel',[100 200 500 800 2000 4000])
ylabel('k')
ylim([0 10])
xlabel('Initial ookinete density')



