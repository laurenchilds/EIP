%% This ODE represents the HIV model in Section 4.2
function dydt=ODEmodel(t,y,X,run_num)

%% PARAMETERS %%
Parameter_settings_EFAST_Modified;

muE=X(run_num,1);
sigmaE=X(run_num,2);
muO=X(run_num,3);
f=X(run_num,4);
k1=X(run_num,5);
dummy=X(run_num,6);

n = 300;
p = 0.2;

N = length(y)-3;

E = y(1);
O = y(2:N+1);
Od = y(N+2);
%S = y(4);

dO = NaN(N,1);

dE = -(muE+sigmaE)*E;
dO(1) = f*sigmaE*E - k1*O(1);
for j=2:N
    dO(j) = k1*N*O(j-1)-k1*N*O(j);
end
dOd = (1-f)*sigmaE*E - muO*Od;
dS = p*n*k1*N*O(end);


dydt = [dE; dO; dOd; dS];
