clear all
close all

c0 = jet(6);
errorall = [];
S_med_all = [];
O_med_all = [];
Od_med_all = [];
Otot_med_all = [];
load('BestFitSolutionsAndData.mat')

best_sporo_soln = best_sporo_soln_sorted;
best_ooc_soln = best_ooc_soln_sorted;
tvec = 0:.1:50;
for j=1:6
    if j==1
    filename = sprintf('ExpG_c5.mat',j);
    elseif j==2
        filename = sprintf('ExpAD_c5.mat',j);
    elseif j==3
        filename = sprintf('ExpH_c5.mat',j);
	elseif j==4
        filename = sprintf('ExpBE_c5.mat',j);
    elseif j==5
        filename = sprintf('ExpI_c5.mat',j);
    elseif j==6
        filename = sprintf('ExpCF_c5.mat',j); 
    end
    load(filename)
    if j==6 || j==4
        errorall = [errorall error(100001:end)];
    else
        errorall = [errorall error];
    end
    par(j).param = param;
    
    
     S_med_all = [S_med_all max(log10(S_med+1),0)];
     S_HDI_all(:,:,j) = S_HDI;
     S_tot(:,j) = S_med;

     Otot_med_all = [Otot_med_all Od_med+O_med];
     O_tot(:,j) = Od_med + O_med;
     Od_HDI_all(:,:,j) = Od_HDI;
     O_HDI_all(:,:,j) = O_HDI;

    
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


 tit={'E(0)=100','E(0)=200','E(0)=500','E(0)=800','E(0)=2000','E(0)=4000'};

%% Oocyst data and best fits
figure(9)
for j=1:6
    subplot(3,2,j)
    plot(tvec,Otot_med_all(:,j),'w--')
    fill([tvec fliplr(tvec)],[(Od_HDI_all(:,1,j)+O_HDI_all(:,1,j))' fliplr((Od_HDI_all(:,2,j)+O_HDI_all(:,2,j))')],[0.7 0.7 0.7])
    plot(tspan,best_ooc_soln(:,j),'r','linewidth',2)
    plot(tspan2,ooc_data_mat_sorted(:,j),'k.','markersize',20)
    plot(tvec,Otot_med_all(:,j),'b--','linewidth',2)
hold off
set(gca,'fontsize',14)
if j>4
xlabel('Days')
end
if j==1 || j==3 || j==5
ylabel('Oocysts')
end
title(tit{j})
xlim([0 45])
end

%% Sporozoite data and best fits
figure(10)
for j=1:6
    subplot(3,2,j)
    plot(tvec,S_med_all(:,j),'w--')
    fill([tvec fliplr(tvec)],[max(log10(S_HDI_all(:,1,j)+1),0)' fliplr(max(log10(S_HDI_all(:,2,j)+1),0)')],[0.7 0.7 0.7])
    plot(tspan,max(log10(best_sporo_soln(:,j)+1),0),'r','linewidth',2)
    plot(tspan2,sporo_data_mat_sorted(:,j),'k.','markersize',20)
    plot(tvec,S_med_all(:,j),'b--','linewidth',2)
    
hold off
title(tit{j})
set(gca,'fontsize',14)



if j>4
xlabel('Days')
end
if j==1 || j==3 || j==5
ylabel('Sporozoite score')
end
xlim([0 45])
end



%% Summary: Peak heights, location and sporozoites
E0 = [100 200 500 800 2000 4000];
for j = 1:6; 
    tO(j) = tvec(find(max(O_tot(:,j))==O_tot(:,j)));
    Omax(j) = max(O_tot(:,j));
    Smax(j) = max(S_tot(:,j));
    tS(j) = tvec(find(S_tot(:,j)>0.01,1,'first')); 
end

%% Plot Summary 
figure(4)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'Position',  [100, 100, 800, 600])
    
subplot(2,2,1)
plot(E0,tO,'.','markersize',30)
set(gca,'fontsize',14)
xlabel('Ookinete Number, E_0')
ylabel('Time of oocyst peak, days')
ylim([0 4])
hold on
subplot(2,2,2)
plot(E0,Omax,'.','markersize',30)
set(gca,'fontsize',14)
xlabel('Ookinete Number, E_0')
ylabel('Peak oocyst number')
ylim([0 300])
hold on
subplot(2,2,4)
plot(E0,log10(Smax),'.','markersize',30)
set(gca,'fontsize',14)
xlabel('Ookinete Number, E_0')
ylabel('Maximum sporozoite score')
ylim([0 3])
hold on
subplot(2,2,3)
plot(E0,tS,'.','markersize',30)
set(gca,'fontsize',14)
xlabel('Ookinete Number, E_0')
ylabel('Time of sporozoite rise, days')
ylim([0 10])
hold on
