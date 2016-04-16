%% main
% This script file will work as a main program file.
% By: Murilo Silva

format compact, clear, clc, clf, close all

%% Load course table into the workspace
T = DatabaseRead();

%% Get courses to be searched
% Ask users how many classes would they would like to include in their
% schedule.

n = -1;
while(n<0)
    n = input('How many classes would you like to search? ');
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



% for h = 1:height(C)
%     k{h,:} = find(ismember(F(:,{'Subject','CatalogNumber'}),C(h,:)));
% end
% 
% for h = 1:length(k)
%     K{:,1,h} = F(k{h},:);
% end
% 
% clear N T C F
% 
% %% 
% 
% uc{length(K(:,:))} = 0;
% 
% for h = 1:length(K(:,:))
%     uc{h} = unique(K{:,1,h}(:,{'Component'}));
%     H{height(uc{h}),h} = 0;
%     for p = 1:height(uc{h})
%         H{p,h} = find(ismember(K{:,1,h}(:,{'Component'}),uc{h}(p,:)));
%         P{p,h} = K{:,1,h}(H{p,h},:);
%     end
% end
% 
% clear h k K p uc H

%%
% %%
% 
% % maximum number of components
% n = length(P(1,:));
% 
% % number of classes
% c = length(P(:,1));
% 
% % number of maximum options for each class
% a(c) = 0;
% 
% % number of components in each class
% d = zeros(1,c);
% 
% % vector that will contain the amounts of components in each class
% f = zeros(1,c);
% 
% for h = 1:c
%     for k = 1:n
%         if(~isequal(P{k,h},[]))
%             b = height(P{k,h});
%             d(h) = d(h)+1;
%             f(h) = f(h)+1;
%             if(b>a(h))
%                 a(h)=b;
%             end
%         end
%     end
% end
% 
% % amount of different possible combinations
% b = prod(a);
% 
% H = cell(b,c);
% 
% t = ones([1 b]);
% 
% for h = 1:c
%     for m = 1:f(h)
%         for t = 1:height(P{m,h}):b
%             for g = 1:height(P{m,h})
%                 H{t+g-1,h} =  [H{t+g-1,h};P{m,h}(g,:)];
%             end
%         end
%     end
% end

