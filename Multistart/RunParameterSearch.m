close all
clear

tic

N_vec = [1:3,10:10:50,75,100];
par   = parameters;

distfolder  = 'Generated';
par.distnum = 1;

Ook0_vec = 2*[100,400,2000,50,250,1000];

% sub-strings for creating filenames
ExpVec = {'A','B','C',...
    'D','E','F',...
    'G','H','I'};
MatTyp = {'D', 'E', 'F'};

basename_ooc   = 'Data/Oocyst/Oocyst';
basename_sporo = 'Data/Sporo/Sporo';

for ii = 1:6 % iterate over experiments
    
    % Clear all variables except the ones specified
    clearvars -except ...
        ii N_vec parameters par distfolder ...
        Ook0_vec ExpVec MatTyp basename_ooc basename_sporo;
    
    if ii <=3
        
        for k = 1:2
            Exp = ExpVec{ii+3*(k-1)};
            
            
            if sum(strcmp(MatTyp, Exp)) > 0
                disp('Read MATLAB file');
                
                filename_ooc = [basename_ooc Exp 'mod.mat']
                filename_sporo = [basename_sporo Exp 'mod.mat']
                
                ExpVar = ['Oocyst' Exp];
                load(filename_ooc, ExpVar);
                d = eval(ExpVar);
                
                ExpVar = ['Sporo' Exp];
                load(filename_sporo, ExpVar);
                sporo = eval(ExpVar);
            else
                disp('Read csv file');
                
                filename_ooc = [basename_ooc Exp '.csv']
                filename_sporo = [basename_sporo Exp '.csv']
                d = csvread(filename_ooc);
                sporo = csvread(filename_sporo);
            end
            
            
            d = round(d);
            sporo(:,1) = round(sporo(:,1));
            
            
            if k == 1
                d1 = d;
                sporo1 = sporo;
            elseif k == 2
                d2 = d;
                sporo2 = sporo;
            end
            
        end
        
    else
        
        Exp = ExpVec{ii+3};
        
        
        if sum(strcmp(MatTyp, Exp)) > 0
            disp('Read MATLAB file');
            
            filename_ooc = [basename_ooc Exp 'mod.mat']
            filename_sporo = [basename_sporo Exp 'mod.mat']
            
            ExpVar = ['Oocyst' Exp];
            load(filename_ooc, ExpVar);
            d = eval(ExpVar);
            
            ExpVar = ['Sporo' Exp];
            load(filename_sporo, ExpVar);
            sporo = eval(ExpVar);
        else
            disp('Read csv file');
            
            filename_ooc = [basename_ooc Exp '.csv']
            filename_sporo = [basename_sporo Exp '.csv']
            d = csvread(filename_ooc);
            sporo = csvread(filename_sporo);
        end
        
        
        d = round(d);
        sporo(:,1) = round(sporo(:,1));
        
    end
    
    
    
    Ook0 = Ook0_vec(ii);
    ParameterSearch
    
    sigma_e_mat(:,ii) = bestpar(:,1);
    
    ParEsts(:,:,ii) = bestpar;
    
    
end



toc



