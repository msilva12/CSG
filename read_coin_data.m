%% Read COIN DATA
% By: Murilo Silva
% Created: 3/10/2016
% Purpose is to create coin_data.mat variable which contains all the
% classes and their sections.
clear,clc,clf,close all

% %% Load coin_data
% load('coin_data_original.mat')
% 
% %% 
% n = length(coindata);
% for k = 1:n
%     c = coindata{k,2};
%    if strcmp(c,'')~=0
%        coindata{k,2}=coindata{k-1,2};
%    end
% end

%% New Coin Data!
% This code will use the ClassSection class to read from CSV

T = readtable('coin_data.csv');

%% Format Data Table

for k = 2:height(T)
   if(isequal(table2array(T(k,1)),{''}))
      T(k,1)=T(k-1,1); 
   end
end

for k = 2:height(T)
   if(isequal(table2array(T(k,2)),{''}))
      T(k,2)=T(k-1,2); 
   end
end

save('coinTable.mat','T')


%%

A = [3:6,16:24];

S = table2array(T(:,A));

R = regexprep(S,'[^\w'']','');

T(:,A) = R;

save('coinTable.mat','T')