close all;
clear all;
clc;
addpath(genpath('./'));

%% Plan path 3
disp('Planning ...');
map = load_map('maps/map3.txt', 0.2, 0.5, 0.25);
start = {[0.0, 5, 5.0]};
stop  = {[20, 5, 5]};
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