clc; clear all; close all;

syms q1 q2 q3 q4

%% DH parameter til transformasjonsmatrise

% Bruk DH parameterene

% Generell formel, j-1 T j
% T = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta)
%     sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta)
%     0 sin(alpha) cos(alpha) d
%     0 0 0 1]; 

%% T0_1
theta = q1;
d = 40.5;
a = 0;
alpha= sym(pi/2);

T0_1 = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta)
    sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta)
    0 sin(alpha) cos(alpha) d
    0 0 0 1];

T0_1 = vpa(T0_1,3)

%% T1_2
theta = q2 + sym(pi/2);
d = 0;
a = 170;
alpha= 0;

T1_2 = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta)
    sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta)
    0 sin(alpha) cos(alpha) d
    0 0 0 1];

T1_2 = vpa(T1_2,3)
%% T2_3
theta = q3+(-pi/2);
d = 0;
a = 120;
alpha= 0;

T2_3 = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta)
    sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta)
    0 sin(alpha) cos(alpha) d
    0 0 0 1];

T2_3 = vpa(T2_3,3)

%% T3_4
theta = q4;
d = 0;
a = 72;
alpha= 0;

T3_4 = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta)
    sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta)
    0 sin(alpha) cos(alpha) d
    0 0 0 1];

T3_4 = vpa(T3_4,3)
%% Alle ilag, altså T_04

T_04 = T0_1*T1_2*T2_3*T3_4;
T_04 = simplify(T_04)
T_04 = vpa(T_04,4)

% For å sette inn verdiene
% T_04_ = subs(T_04,[q1 q2 q3 q4],[0 0 0 0]);
% T_04__ =double(T_04_)