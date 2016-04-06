%% CourseSearch
% This script file will work a main program file.
% By: Murilo Silva

format compact, clear, clc, clf, close all

%% Load course table into the workspace
load('coinTable.mat')

%% Get courses to be searched
% Ask users how many classes would they would like to include in their
% schedule.

n = -1;
while(n<0)
    n = input('How many classes would you like to search? ');
    if(n==0)
        return
    elseif(n<0)
        disp('Please enter a number greater than 0, or enter 0 to exit the program');
    elseif(n>8)
        disp('Be realistic. You will not take more than 8 classes.');
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
C = table(c(:,1),c(:,2),'VariableNames',{'Subject' 'Course'});

clear c e k lev n s sub ui
%% Search Courses in C

n = height(C);

for k = 1:1
    
end