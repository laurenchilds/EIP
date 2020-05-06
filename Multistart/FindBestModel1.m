close all 
clearvars -except folder


load(strcat(folder,'SummaryParameterEstimates_sorted.mat'))
load(strcat(folder,'SummaryAICc_sorted.mat'))

N_vec = [1:3,10:10:50,75,100];


for i = 1:6
    
   [val(i),ix(i)] = min(AICc_mat(i,2:end)); 
   
   Model2AICc(i) = AICc_mat(i,1);
   BestModel1AICc(i) = val(i);
   
   if Model2AICc(i)<BestModel1AICc(i)
       BestOverallModel(i) = 1;
   else
       BestOverallModel(i) = N_vec(ix(i)+1);
   end
   
   BestModel1(i) = N_vec(ix(i)+1);
   
   BestModel1params(i,:) = paramsALL_sorted(ix(i),i,:);
   Model2params(i,:) = paramsALL_sorted(end,i,:);
    
end


save(strcat(folder,'BestModelOutput.mat'),'Model2AICc','BestModel1AICc',...
    'BestOverallModel','BestModel1params','Model2params','BestModel1')
