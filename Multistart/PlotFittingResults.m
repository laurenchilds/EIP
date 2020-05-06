% Requires ParasiteModel.m

close all
clearvars -except folder


load(strcat(folder,'ExperimentalData_Sorted_by_E0.mat'),'tspan','ooc_data_mat_sorted','sporo_data_mat_sorted')
tspan2 = tspan;


% Plot best fit solutions:

N_original = [1:3,10:10:50,75,100];
N = N_original([2:end,1]);
Tf = 42;
Init_ook = 2*[100,400,2000,50,250,1000];
[out, idx] = sort(Init_ook);


ExpVec = {'A','B','C','D','E','F','G','H','I'};
ExpVec_new = {'AD','BE','CF','G','H','I'};

cmap = colormap(jet(length(N)));

h1 = figure(1);
h2 = figure(2);
hold on

for j = 1:6 %Iterate over experiments
    
    
    Exp = ExpVec_new{idx(j)}(end);
    Ook0 = Init_ook(idx(j));
    
    
    Tflong = 45;
    tspan = linspace(0,Tflong,100);
    
    for iii = 1:length(N) % Iterate over Number of oocyst stages N
        

        filename_out = [folder 'BestFitData_Nmax=' num2str(N(iii)) '_Tf=' num2str(Tf) '_IC=' num2str(Ook0) '_Exp' Exp '.mat'];% '_outlier_removed.mat'];
        load(filename_out,'xsol','par')
        
        
        
        disp('*************************************');
        disp(['Number of rupturing oocyst stages = ' num2str(par.N)]);
        
        options = odeset('NonNegative',1:(par.N+3));
        IC = [Ook0, zeros(1,par.N+2)];
        par.IC = IC;
        
        par.sigma_e = xsol(1);
        par.mu_e = xsol(2);
        par.mu_o = xsol(3);
        par.k = xsol(4);
        par.f = xsol(5);
        
        if par.N == 1
            par.t0 = xsol(6);
            t_star = log(2^(1/par.k)*(1+exp(par.t0))-exp(par.t0));%par.t0 + log(2^(1+1/par.k) - 1);
        end
        [t,y] = ode45(@ParasiteModel,tspan,IC,options,par);
        BestModel = [30 50 1 1 75 1];      
        if N(iii) == BestModel(j)
            best_ooc_soln_sorted(:,j) = sum(y(:,2:end-1),2);
            best_sporo_soln_sorted(:,j) = y(:,end);
        end
         
        % -- PLOT of oocyst best fits versus time -- %
        
        figure(1)
        subplot(3,2,j)
        hold all
        p(iii) = plot(t,sum(y(:,2:end-1),2),'linewidth',2,'color',cmap(iii,:),'lineStyle','-');

        
        plot(tspan2(1:42),ooc_data_mat_sorted(1:42,j),'k.','MarkerSize',14)
        plot(tspan2(43:end),ooc_data_mat_sorted(43:end,j),'k.','MarkerSize',14)
        if mod(j,2)==1
            ylabel('Oocyst Count')
        end
        if j == 5|| j == 6
            xlabel('Days')
        end
        title(['E(0) = ' num2str(Init_ook(idx(j)))]);
        xlim([0,42])
        set(gca,'FontSize',14)%,'FontWeight','bold')
        
        
        Sporo = y(:,end);
        
        % -- PLOT of sporo load fits versus time -- %
        figure(2)
        subplot(3,2,j)
        hold all
        p(iii) = plot(tspan,log10(Sporo+1),'LineWidth',2,'color',cmap(iii,:));
        plot(tspan2(1:42),sporo_data_mat_sorted(1:42,j),'k.','MarkerSize',14)
        plot(tspan2(43:end),sporo_data_mat_sorted(43:end,j),'k.','MarkerSize',14)
        if mod(j,2)==1
            ylabel('Sporozoite score')
        end
        if j == 5|| j == 6
            xlabel('Days')
        end
        title(['E(0) = ' num2str(Init_ook(idx(j)))]);
        xlim([0,42])
        set(gca,'FontSize',14)
        
        
        if par.N == 1
            EIP_sorted(iii,j) = t_star + 1/(par.mu_e + par.sigma_e);
            paramsALL_sorted(iii,j,1:7) = [xsol t_star];
            
        elseif par.N >1
            EIP_sorted(iii,j) = 1/par.k + 1/(par.mu_e + par.sigma_e);
            paramsALL_sorted(iii,j,1:5) = xsol;
        end             
        
        leg_name{iii} = num2str(par.N);
        
    end
    
    
    
    
end

leg_name{iii} = 'Model 2';


set(h1, 'PaperPositionMode', 'manual');
set(h1, 'Position',  [100, 100, 600, 800])

set(h2, 'PaperPositionMode', 'manual');
set(h2, 'Position',  [100, 100, 600, 800])

saveas(h1,strcat(folder,'BestTemporalFits_Oocysts-sorted.eps'),'epsc')
saveas(h2,strcat(folder,'BestTemporalFits_Sporos-sorted.eps'),'epsc')

save(strcat(folder,'SummaryParameterEstimates_sorted.mat'),'EIP_sorted', 'paramsALL_sorted')
save(strcat(folder,'BestFitSolutions.mat'),'best_ooc_soln_sorted','best_sporo_soln_sorted','tspan2','tspan')


%%
h3 = figure(10);
cmap = colormap(jet(length(N)));
for j=1:length(N)
    plot([1,2],rand(1,2),'linewidth',2,'color',cmap(j,:))
    hold on
end
l = legend('2','3','10','20','30','40','50','75','100','Model 2','Orientation','horizontal');
set(l,'fontsize',20)
xlim([4 5])


set(h3, 'PaperPositionMode', 'manual');
set(h3, 'Position',  [100, 100, 1000, 200])
