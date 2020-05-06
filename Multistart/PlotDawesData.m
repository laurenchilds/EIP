close all
clearvars -except folder
folder

% sub-strings for creating filenames
ExpVec = {'A','B','C',...
    'D','E','F',...
    'G','H','I'};
MatTyp = {'D', 'E', 'F'};

basename_ooc   = 'Data/Oocyst/Oocyst';
basename_sporo = 'Data/Sporo/Sporo';

ooc_data_mat = nan(2*42,6);
sporo_data_mat = nan(2*42,6);

h = figure(1);

for ii = 1:6 % iterate over experiments
    
    % Clear all variables except the ones specified
    clearvars -except folder ...
        ii N_vec parameters par distfolder ...
        Ook0_vec ExpVec MatTyp basename_ooc basename_sporo h ...
        ooc_data_mat sporo_data_mat;
    
    
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
        
        ooc_data_mat([d1(:,1);42+d2(:,1)],ii) = [d1(:,2);d2(:,2)];
        sporo_data_mat([sporo1(:,1);42+sporo2(:,1)],ii) = [sporo1(:,2);sporo2(:,2)];
        
        % plot oocyst data:
        subplot(6,2,2*(ii-1)+1);
        hold all
        plot(d1(:,1),d1(:,2),'.','MarkerSize',10)
        plot(d2(:,1),d2(:,2),'.','MarkerSize',10)

        if 2*(ii-1)+1 == 11
            xlabel('Time in days')
        end
        if 2*(ii-1)+1 == 1
            title('Oocyst Counts')
        end
        if ii<=3
            ylabel([ExpVec{ii} ' & ' Exp])
        else
            ylabel(Exp)
        end
        set(gca,'FontSize',12,'FontWeight','bold')
        
        
        % plot sporo data
        subplot(6,2,2*(ii-1)+2);
        hold all
        plot(sporo1(:,1),sporo1(:,2),'.','MarkerSize',10)
        plot(sporo2(:,1),sporo2(:,2),'.','MarkerSize',10)

        if 2*(ii-1)+2 == 12
            xlabel('Time in days')
        end
        if 2*(ii-1)+2 == 2
            title('Sporozoite Score')
        end
        set(gca,'FontSize',12,'FontWeight','bold')
        
        
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
        
        sporo(:,1) = round(sporo(:,1));
        
        ooc_data_mat(d(:,1),ii) = d(:,2);
        sporo_data_mat(sporo(:,1),ii) = sporo(:,2);
        
        subplot(6,2,2*(ii-1)+1);
        hold all
        plot(d(:,1),d(:,2),'.','MarkerSize',10)
        if 2*(ii-1)+1 == 11
            xlabel('Time in days')
        end
        if 2*(ii-1)+1 == 1
            title('Oocyst Counts')
        end
        if ii<=3
            ylabel([ExpVec{ii} ' & ' Exp])
        else
            ylabel(Exp)
        end
        set(gca,'FontSize',12,'FontWeight','bold')
        
        

        subplot(6,2,2*(ii-1)+2);
        hold all
        plot(sporo(:,1),sporo(:,2),'.','MarkerSize',10)
        if 2*(ii-1)+2 == 12
            xlabel('Time in days')
        end
        if 2*(ii-1)+2 == 2
            title('Sporozoite Score')
        end
        set(gca,'FontSize',12,'FontWeight','bold')
        
     
    end
    
    
    
    
end

tspan = [1:42,1:42];

Init_ook = 2*[100,400,2000,50,250,1000];
[out idx] = sort(Init_ook);

ooc_data_mat_sorted = ooc_data_mat(:,idx);
sporo_data_mat_sorted = sporo_data_mat(:,idx);

save(strcat(folder,'ExperimentalData_Sorted_by_E0.mat'),'ooc_data_mat_sorted','sporo_data_mat_sorted','tspan')


Ook0_vec = 2*[100,400,2000,50,250,1000];

cmap = colormap(lines);

close all
h5 = figure(5);
for i = 1:6
    subplot(3,2,i)
    title(['E(0) = ' num2str(Ook0_vec(idx(i)))])
    
    yyaxis left
    hold all
    plot(tspan(1:42),ooc_data_mat_sorted(1:42,i),'sq','MarkerSize',5)
    plot(tspan(43:end),ooc_data_mat_sorted(43:end,i),'sq','MarkerSize',5,'MarkerFaceColor',cmap(1,:))
    if mod(i,2)==1
        ylabel('Oocyst Count')
    end
    
    yyaxis right
    hold all
    plot(tspan(1:42),sporo_data_mat_sorted(1:42,i),'>','MarkerSize',5)%,'MarkerFaceColor','b')
    plot(tspan(43:end),sporo_data_mat_sorted(43:end,i),'>','MarkerSize',5,'MarkerFaceColor',cmap(2,:))%,'MarkerFaceColor','r')
    if mod(i,2) == 0
        ylabel('Sporozoite Score')
    end
    xlim([0,42])
    
    if i>4
        xlabel('Time in days')
    end
    
    set(gca,'FontSize',12,'FontWeight','bold')
    
    
end


saveas(h5,strcat(folder,'DawesDataPlot.eps'),'epsc')





