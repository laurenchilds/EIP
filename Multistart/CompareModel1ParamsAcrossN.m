close all

load(strcat(folder,'SummaryParameterEstimates_sorted.mat'))

par_names = {'\sigma_E','\mu_E','\mu_O','\beta','f'};
Init_ook = sort(2*[100,400,2000,50,250,1000]);

cmap = colormap(copper);
c = cmap(1:5:50,:);

h1 = figure(1);

for i = 1:5
    
    subplot(3,2,i)
    y = paramsALL_sorted(1:end-1,:,i)';
    b = bar(y);
    ylabel(par_names{i})
    set(gca,'xticklabels',Init_ook)
    set(gca,'FontSize',14)

    
    if i == 4
        ylim([0,.1])
    elseif i == 3
        ylim([0,0.1])
    end
    
    for k = 1:size(y,2)
        b(k).FaceColor = c(k,:);
    end
    
end

set(gca,'xticklabels',Init_ook)
xlabel('E(0)')


subplot(3,2,i+1)
b = bar(paramsALL_sorted(1:end-1,:,1)'+paramsALL_sorted(1:end-1,:,2)');

for k = 1:size(y,2)
    b(k).FaceColor = c(k,:);
end

set(gca,'xticklabels',Init_ook)
xlabel('E(0)')
ylabel('\mu_E+\sigma_E')
set(gca,'FontSize',14)
 

set(h1, 'PaperPositionMode', 'manual');
set(h1, 'Position',  [0, 0, 2000, 500])

hgexport(h1,strcat(folder,'CompareModel1ParamsAcrossN.eps'))

saveas(h1,strcat(folder,'CompareModel1ParamsAcrossN_test.fig'),'fig')

