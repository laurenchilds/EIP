function error = objfun(p,d1,d2,sporo1,sporo2,par,ii)



par.sigma_e = p(1);
par.mu_e = p(2);
par.mu_o = p(3);
par.k = p(4);
par.f = p(5);
if par.N == 1
    par.t0 = p(6);
end

ixo1 = par.ix1;
ixo2 = par.ix2;
tspan1 = par.tspan1;
tspan2 = par.tspan2;
ixs1 = find(par.tspan1==sporo1(1,1)); 
ixs2 = find(par.tspan2==sporo2(1,1)); 

IC = par.IC;

options = odeset('NonNegative',1:par.N+3);

[t1,y1] = ode45(@ParasiteModel,tspan1,IC,options,par);
[t2,y2] = ode45(@ParasiteModel,tspan2,IC,options,par);

model_sporo_load1 = y1(ixs1:end,end);
model_sporo_load2 = y2(ixs2:end,end);
sporo_new1 = round(10.^sporo1(:,2)-1);
sporo_new2 = round(10.^sporo2(:,2)-1);

for c1 = 1:length(sporo1(:,2))
    sporo_new1(c1,1) = mean((10^floor(sporo1(c1,2))):(10^sporo1(c1,2)));
end
for c1 = 1:length(sporo2(:,2))
    sporo_new2(c1,1) = mean((10^floor(sporo2(c1,2))):(10^sporo2(c1,2)));
end



o1 = sum(y1(2:end,2:end-1),2);
o2 = sum(y2(2:end,2:end-1),2);
erroro1 = -sum(d1(ixo1,2).*log(o1) - o1) + ...
    sum(arrayfun(@(x) sum(log(1:x)),d1(ixo1,2)));
erroro2 = -sum(d2(ixo2,2).*log(o2) - o2)+ ...
    sum(arrayfun(@(x) sum(log(1:x)),d2(ixo2,2)));


errors1 = -sum(sporo_new1.*log(model_sporo_load1) - model_sporo_load1) + ...
    sum(arrayfun(@(x) sum(log(1:x)),sporo_new1));
errors2 = -sum(sporo_new2.*log(model_sporo_load2) - model_sporo_load2) + ...
    sum(arrayfun(@(x) sum(log(1:x)),sporo_new2));

% total error
error = erroro1 + erroro2 + errors1 + errors2;

if ii>3
    error = error/2;
end


if error == Inf
    error = 1e9;
end


