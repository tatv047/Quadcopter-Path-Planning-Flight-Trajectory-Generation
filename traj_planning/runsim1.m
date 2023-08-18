close all;
clear all;
clc;
addpath(genpath('./'));


%% Plan path 1
disp('Planning ...');
map = load_map('maps/map1.txt', 0.1, 2, 0.25);
start = {[0.0  -4.9 0.2]};
stop  = {[6.0  18.0-1 5.0]};
% stop  = {[6.0  18.0-6 3.0]};
nquad = length(start);
for qn = 1:nquad
    tic
    path{qn} = dijkstra(map, start{qn}, stop{qn}, true);
    toc
end 
    
plot_path(map, path{1});



%% Additional init script
init_script;

%% Run trajectory
trajectory = test_trajectory(start, stop, map, path, true); % with visualization