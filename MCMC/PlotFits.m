clear all
close all

c0 = jet(6);
errorall = [];
S_med_all = [];
O_med_all = [];
Od_med_all = [];
Otot_med_all = [];
load('BestFitSolutions.mat')


best_sporo_soln = best_sporo_soln_sorted;
best_ooc_soln = best_ooc_soln_sorted;

for j=1:6
    if j==1
    filename = sprintf('ExpG.mat',j);
    elseif j==2
        filename = sprintf('ExpAD.mat',j);
    elseif j==3
        filename = sprintf('ExpH.mat',j);
	elseif j==4
        filename = sprintf('ExpBE.mat',j);
    elseif j==5
        filename = sprintf('ExpI.mat',j);
    elseif j==6
        filename = sprintf('ExpCF_all.mat',j); 
    end
    load(filename)
    if j==7
        errorall = [errorall error(100001:end)];
    else
        errorall = [errorall error];
    end
    par(j).param = param;
    
    
    % Oocyst MCMC posterior interval
    figure(1)
    fill([0:50 fliplr(0:50)],[max(log10(S_HDI(:,1)+1),0)' fliplr(max(log10(S_HDI(:,2)+1),0)')],c0(j,:))
    S_med_all = [S_med_all max(log10(S_med+1),0)];
    hold on; 
    
    % Sporozoite MCMC posterior interval
    figure(2)
    fill([0:50 fliplr(0:50)],[(Od_HDI(:,1)+O_HDI(:,1))' fliplr((Od_HDI(:,2)+O_HDI(:,2))')],c0(j,:))
    Otot_med_all = [Otot_med_all Od_med+O_med];
    hold on;
    
    % Oocyst data and best fits
    figure(9)
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'Position',  [100, 100, 600, 1000])
    subplot(3,2,j)
    hold on
    
    % Sporozoite data and best fits
    figure(10)
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'Position',  [100, 100, 600, 1000])
    subplot(3,2,j)
    hold on
end

% Oocyst MCMC posterior interval
figure(1)
for j=1:6
    plot(0:50,S_med_all(:,j),'w--')
end
hold off
set(gca,'fontsize',14)
xlabel('Days')
ylabel('Sporozoite score')
l = legend('E(0)=100','E(0)=200','E(0)=500','E(0)=800','E(0)=2000','E(0)=4000','location','northwest');
set(l,'box','off')


% Sporozoite MCMC posterior interval
figure(2)
for j=1:6
    plot(0:50,Otot_med_all(:,j),'w--')
end
hold off
set(gca,'fontsize',14)
xlabel('Days')
ylabel('Oocysts')
l = legend('E(0)=100','E(0)=200','E(0)=500','E(0)=800','E(0)=2000','E(0)=4000','location','northeast');
set(l,'box','off')
tit={'E(0)=100','E(0)=200','E(0)=500','E(0)=800','E(0)=2000','E(0)=4000'};

% Oocyst data and best fits
figure(9)
for j=1:6
    subplot(3,2,j)
    plot(0:50,Otot_med_all(:,j),'w--')
    plot(linspace(0,42,100),best_ooc_soln(:,j),'r','linewidth',2)
    plot(tspan,ooc_data_mat_sorted(:,j),'k.','markersize',20)
    plot(0:50,Otot_med_all(:,j),'b--','linewidth',2)
hold off
set(gca,'fontsize',14)
if j>4
xlabel('Days')
end
if j==1 || j==3 || j==5
ylabel('Oocysts')
end
title(tit{j})
xlim([0 40])
end

% Sporozoite data and best fits
figure(10)
for j=1:6
    subplot(3,2,j)
    plot(0:50,S_med_all(:,j),'w--')
    plot(linspace(0,42,100),max(log10(best_sporo_soln(:,j)+1),0),'r','linewidth',2)
    plot(tspan,sporo_data_mat_sorted(:,j),'k.','markersize',20)
    plot(0:50,S_med_all(:,j),'b--','linewidth',2)
hold off
title(tit{j})
set(gca,'fontsize',14)
if j>4
xlabel('Days')
end
if j==1 || j==3 || j==5
ylabel('Sporozoite score')
end
xlim([0 40])
end