%% Read COIN DATA
% By: Murilo Silva
% Created: 3/10/2016
% Purpose is to create coin_data.mat variable which contains all the
% classes and their sections.
clear,clc,clf,close all

%% Load coin_data
load('coin_data_original.mat')

%% 
n = length(coindata);
for k = 1:n
    c = coindata{k,2};
   if strcmp(c,'')~=0
       coindata{k,2}=coindata{k-1,2};
   end
end
