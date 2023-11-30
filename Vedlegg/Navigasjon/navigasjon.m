%%navigasjon
close all;
clc;

% Last det forhåndsdefinerte huskartet
load house

% Lager tilfeldig posisjon for "leke"
random_x = randi([0, 500]);
random_y = randi([0, 350]);

init = [50, 50]; % Startposisjon

goal = [random_x, random_y]; % Målet (leken) sin posisjon

% Sjekk om målet er innenfor en hindring og genererer ny plassering om den
% er i en hindring
while is_inside_obstacle(goal, house)
    random_x = randi([0, 500]);
    random_y = randi([0, 350]);
    goal = [random_x, random_y];
end

% PRM
N_points = 300; % Antall punkter for PRM
out = m_PRM_nav(init, goal, N_points);

DsGoal = init;
DsInit = goal;

% D*
out = m_Dstar_nav(DsGoal, DsInit);



function inside = is_inside_obstacle(point, obstacle_map)
    x = round(point(1));
    y = round(point(2));
    
    % Sjekk om punktet er innenfor en hindring (høy kostnad)
    inside = obstacle_map(y, x) == 1; % Endre 1 til den relevante verdien for hindringer
end
