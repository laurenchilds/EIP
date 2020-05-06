close all
clearvars -except folder


N = [1:3,10:10:50,75,100];

Tf = 42;
Init_ook = 2*[100,400,2000,50,250,1000];

[out, idx] = sort(Init_ook);

ExpVec = {'A','B','C','D','E','F','G','H','I'};

AICc_mat = nan(6,length(N));

h = figure(2);

for jjj = 1:6 % iterate over experiments.
    Exp = ExpVec{idx(jjj)+3};
    Ook0 = Init_ook(idx(jjj));
    
    disp(Exp)
    
    for iii = 1:length(N) % iterate over # of Oocyst stages N.
        
        
        disp(num2str(N(iii)))
        
        filename_out = strcat(folder,'BestFitData_Nmax=',num2str(N(iii)),'_Tf=',num2str(Tf),'_IC=',num2str(Ook0),'_Exp',Exp,'.mat');
        
        load(filename_out,'sporo1','sporo2','sporo','d','d1','d2','initial_parameter_guess','fval')

        % Calculate AIC
        K = length(initial_parameter_guess);
        if idx(jjj) <=3
            nn = length(sporo1(:,1))+length(sporo2(:,1))+ length(d1(:,1))+length(d2(:,1));
        else
            nn = length(sporo(:,1))+length(d(:,1));
        end
        AIC = 2*length(initial_parameter_guess) + 2*fval;%- 2*log(bestfval);
        AICc_mat(jjj,iii) = AIC + (2*K^2+2*K)/(nn-K-1);
        
        
        clearvars -except N Tf Exp Ook0 ExpVec jjj...
            iii AICc_mat h Init_ook idx folder
        
    end
    
    subplot(2,3,jjj)
    hold on
    plot(N(2:end),AICc_mat(jjj,2:end),'.-','markersize',10)
    plot(N,AICc_mat(jjj,1)*ones(size(N)),'k--','LineWidth',2)
    set(gca,'FontSize',12,'FontWeight','bold')
    
        set(gca,'xtick',0:25:100)
        set(gca,'xticklabel',0:25:100)
    
    if sum(jjj==[4,5,6])==1
        xlabel('Oocyst Stages, N')
        set(gca,'xtick',0:25:100)
        set(gca,'xticklabel',0:25:100)
    end
    if sum(jjj==[1,4])==1
        ylabel('AICc')
    end
    
    
    title(['E(0) = ' num2str(Ook0)])
    
end

save(strcat(folder,'SummaryAICc_sorted.mat'),'AICc_mat')