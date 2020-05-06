function dxdt = ParasiteModel(t,y,par)

N = par.N; % Number of oocyst stages
f = par.f;
sigma_e = par.sigma_e;
mu_e = par.mu_e;
n = par.n;
p = par.p;
t0 = par.t0;
if N == 1
    k = par.k/(1+exp(t0-t));
    mu_o = par.mu_o;
elseif N>1
    k = par.k*N;
    mu_o = par.mu_o;
end

E = y(1); % ookinetes
Or = y(2:N+1); %oocyst stages that will rupture
Od = y(N+2); %oocyst stages that will die

dOr = NaN(N,1);
dE = - mu_e*E - sigma_e*E; % Ookinetes
dOr(1) = f*sigma_e*E - k*Or(1);
dOd = (1-f)*sigma_e*E - mu_o*Od;
for i = 2:N
    dOr(i,1) = k*Or(i-1) - k*Or(i); % Rupturing Oocysts
end
dS = n*p*k*Or(N); % Sporozoites


dxdt = [dE;dOr;dOd;dS];%dOcount;dBcount];