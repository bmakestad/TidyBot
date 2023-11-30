function out=m_Dstar_nav(init,goal)
% Simulates the Dstar algoritm
%% Example of function call
%% (if call fails, try "load house" in cmd window before running function):
disp('ds=occ_grid(place.br3,place.kitchen')

%% Initializing
% Load a predefined occupancy grid of a house
load house
about house

% Display the values of the "place" struct
disp('place=')
disp(' kitchen: [320 190]')
disp(' garage: [500 150]')
disp(' br1: [50 220]')
disp(' br2: [120 50]')
disp(' br3: [50 50]')
disp(' nook: [320 280]')
disp(' mudroom: [320 50]')
disp(' patio: [200 350]')
disp(' study: [220 50]')
disp(' garden: [100 350]')
disp('driveway: [500 350]')
disp(' living: [220 200]')

%% Navigation using distance transform
ds = Dstar(house); % Construct the navigation object ds
c = ds.costmap(); % Retrieve costmap

figure('name', 'D*'); % New figure
disp('The planning loop takes ')
%ds.plan(goal,'animate') % Animate the dstar cost map with 1 and inf's
ds.plan(goal) % Plan the dstar cost map with 1 and inf's

%ds.plan(goal); % Compute a plan for the grid from the goal
%ds.plan(); % Update the plan
%ds.plot() % Plot the grid

p = ds.query(init); % Plan a path from init in the grid
ds.plot(p) % Plot the path in the grid

%% Modifying cost
ds.modify_cost([300, 340; 105, 130], Inf); % Modifies cost of a rectangle by 100


disp('The replanning takes ')
ds.plan(); % Update the plan

%ds.plot() % Plot replanned grid

p = ds.query(init); % Plan a path from init in the grid



figure('name', 'D* med kostnad'); % New figure

ds.plot(p) % Plot the path in the grid

out=ds; % Returns the navigation object