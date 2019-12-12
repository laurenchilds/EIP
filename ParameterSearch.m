
par.Tf = 42;

if ii>3
    d1 = d;
    d2 = d;
    sporo1 = sporo;
    sporo2 = sporo;
end


Tf = par.Tf;
par.ix1 = find(d1(:,1)<=Tf);
ix1 = par.ix1;

par.ix2 = find(d2(:,1)<=Tf);
ix2 = par.ix2;

par.tspan1 = [0 d1(ix1,1)'];
par.tspan2 = [0 d2(ix2,1)'];

% Initializing parameters, variables and multistart set-up

NumPar  = 6; %length(initial_parameter_guess);
NumIC   = 2*max(N_vec)+2;
NumIter = length(N_vec);
numstartpoints=10;
bestpar  = nan(NumIter,NumPar);
bestEF   = nan(NumIter,1);
bestfval = nan(NumIter,1);
options  = optimset('MaxFunEvals',...
    (NumPar+NumIC)*1e5,'MaxIter',(NumPar+NumIC)*1e5);
% defines a multistart problem
ms=MultiStart('Display','iter',...
    'StartPointsToRun','bounds-ineqs');

%%%%%%%% Multistart:

for i = 1:NumIter
    
    par.N = N_vec(i);
    
    disp('*************************************');
    disp(['Number of rupturing oocyst stages = ' num2str(par.N)]);
    
    if par.N > 1
        initial_parameter_guess = ...
            [par.sigma_e,par.mu_e,par.mu_o,par.k,par.f];
    elseif par.N==1
        initial_parameter_guess = ...
            [par.sigma_e,par.mu_e,par.mu_o,par.k,par.f,par.t0];
    end
    
    if par.N > 1
        LowerBounds = [0,0,0,0,0];
        UpperBounds = [2,2,2,10,1];
        Aeq = [1,1,0,0,0];
    elseif par.N==1
        LowerBounds = [0,0,0,0,0,1];
        UpperBounds = [2,2,2,10,1,Tf];
        Aeq = [1,1,0,0,0,0];
    end
    beq = 2;
    
    xstart=initial_parameter_guess;
    
    
    % Initial conditions:
    IC = [Ook0 zeros(1,par.N+2)];
    par.IC = IC;
    
    
    problem = createOptimProblem('fmincon','x0',...
        xstart,'objective',@(x)objfun(x,d1,d2,sporo1,sporo2,par,ii)...
        ,'lb',LowerBounds,'ub',UpperBounds);
    
    
    
    [xsol,fval,exitflag,output,manymins]=...
        run(ms,problem,numstartpoints);  %runs the multistart
    
    bestpar(i,1:length(initial_parameter_guess)) = xsol;
    bestEF(i) = exitflag;
    bestfval(i) = fval;
    
    
    
    filename_out = ['OutputData/' distfolder ...
        '/BestFitData_N=' num2str(N_vec(i)) ...
        '_Tf=' num2str(Tf) ...
        '_IC=' num2str(Ook0) ...
        '_Exp' Exp '.mat'];
    
    save(filename_out)
    
end


