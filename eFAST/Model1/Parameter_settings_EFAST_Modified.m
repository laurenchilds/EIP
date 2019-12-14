%% PARAMETER INITIALIZATION
% set up max and mix matrices

pmin=[0.34, % muE 
0.03, % sigmaE
0.02, % muO
0.01, % f 
0.5*0.05, % k
1]; % dummy

pmax=[2, % muE 
2, % sigmaE
0.09, % muO
0.1, % f 
2*.061, % k
10]; % dummy


% Parameter Labels 
efast_var={'\mu_E', '\sigma_E', '\mu_O', ...
    'f','k', 'dummy'};%,

% PARAMETER BASELINE VALUES
muE=1.85; 
sigmaE=0.14;
muO=0.045;
f=0.045;
k1=0.057;
dummy=1;
N = 30;

%% TIME SPAN OF THE SIMULATION
t_end=42; % length of the simulations
tspan=(0:1:t_end);   % time points where the output is calculated
time_points=1:t_end-1; % time points of interest for the US analysis

% INITIAL CONDITION FOR THE ODE MODEL
E0 = 100;
O0 = zeros(N,1);
Od0 = 0;
S0 = 0;

y0=[E0;O0;Od0;S0];

% Variables Labels
y_var_label={'E','O','Od','S'};
