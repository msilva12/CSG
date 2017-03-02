%% main
% This script file will work as a main program file.
% By: Murilo Silva

format compact, clear, clc, clf, close all

%% Load course table into the workspace
T = DatabaseRead();

%% Get courses to be searched
% Ask users how many classes would they would like to include in their
% schedule.

% Initialize loop breaker.
n = -1;

% Start loop asking user for number of classes
while(n<0)
    % Get integer number of classes
    n = input('How many classes would you like to search? ');
    
    % If no number is entered display error
    if(isempty(n))
        disp('Please enter a number greater than 0, or enter 0 to exit the program');
        n=-1;
    elseif(n==0)
        return
    elseif(n<0)
        disp('Please enter a number greater than 0, or enter 0 to exit the program');
    elseif(n>8)
        disp('Be realistic. You will not take more than 8 classes.');
        n=-1;        
    else
        k=1;
    end
end
ui = {1};
while(k<=n)
    ui{k} = upper(input('Subject and level (e.x. BIO 101): ','s'));
    [s e] = regexp(ui{k},'([a-z]+|[A-Z]+)|(\d+)');
    if((length(s)==2)&&(length(e)==2))
        sub = ui{k}(s(1):e(1));
        lev = ui{k}(s(2):e(2));
        c{k,1} = sub;
        c{k,2} = lev;
        k = k+1;
    else
        disp('Please enter a valid subject and level (e.x. BIO 101, EGR 111)')
    end
end

C = table(c(:,1),c(:,2),'VariableNames',{'Subject' 'CatalogNumber'});

clear c e k lev n s sub ui

%% Search Courses in C
clc

% [F N] = fclass(C,T);
[P, N] = CourseSearch(T,C);

if(height(N))
    disp('The following courses were not found:')
    fprintf('%s %s\n\n',table2array(N{:,1}),table2array(N{:,2}))
    ui = input('Enter 1 to continue anyways or 0 to start over: ');
    if(ui==0)
        main
        return
    end
end

%% Schedule Generator
S = ScheduleGenerator(P);


%% Export
ScheduleExport(S,'Test')
