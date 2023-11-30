function out=m_PRM_nav(init,goal,N_points)
% Simulates the PRM navigation algorithm
%% Example of function call
%% (if call fails, try "load house" in cmd window before running function):
disp('dx=m_PRM_nav(place.br3, place.patio,150)')
%% Initializing
% Load a predefined occupancy grid of a house
load house
about house
randinit; % to reproduce results in book
%% Navigation using probabilistic roadmaps
figure('name', 'PRM');
prm = PRM(house) % Create PRM object
prm.plan('npoints',N_points) % Create a PRM plan (should be >150 points)
prm.plot() % Plot plan (and path)
p=prm.query(init,goal); % Find a path from init to goal
prm.plot(p) % Plot plan (and path)
out=prm;
