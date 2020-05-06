%% This ODE represents the HIV model in Section 4.2
function dydt=ODEmodel(t,y,X,run_num)

%% PARAMETERS %%
Parameter_settings_EFAST_Modified;

muE=X(run_num,1);
sigmaE=X(run_num,2);
muO=X(run_num,3);
f=X(run_num,4);
k1=X(run_num,5);
tb=X(run_num,6);
dummy=X(run_num,7);

n = 300;
p = 0.2;

E = y(1);
O = y(2);
Od = y(3);
%S = y(4);

dE = -(muE+sigmaE)*E;
dO = f*sigmaE*E - k1/(1+exp(tb-t))*O;
dOd = (1-f)*sigmaE*E - muO*Od;
dS = p*n*k1/(1+exp(tb-t))*O;


dydt = [dE; dO; dOd; dS];