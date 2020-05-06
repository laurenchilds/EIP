close all
clearvars -except folder

N = [1:3,10:10:50,75,100];


load(strcat(folder,'SummaryParameterEstimates_sorted.mat'))
% ----------

load(strcat(folder,'SummaryAICc_sorted.mat'))
[M,I] = min(AICc_mat,[],2); % Find Best Fit out of Modls 1 and 2
[M2,I2] = min(AICc_mat(:,2:end),[],2); % Find Best Model 1 Fit

BestModel_sorted = N(I)

BestEIPMat2 = nan(6,2);

for i = 1:6
    BestEIPMat2(i,2) = EIP_sorted(end,i);
    BestEIPMat2(i,1) = EIP_sorted(I2(i),i);
    label_name{i} = ['N = ' num2str(N(I2(i)+1))];
end

for i = 1:6
    
    BestParams_sorted(i,:) = [reshape(paramsALL_sorted(I(i),i,:),1,7),N(I(i))];
    
end


save(strcat(folder,'BestModel_sorted.mat'),'BestModel_sorted','BestParams_sorted','BestEIPMat2')

