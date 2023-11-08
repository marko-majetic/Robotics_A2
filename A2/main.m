clear all;
close all;
clf;



% Load environment
CreateEnvironment;

% Load external objects
repairObjects.box1;
repairObjects.box2;
repairObjects.solarPanel;

% Fetch movement
passTool;
 

% Call controlfunction to load IRB and perform tasks from robotMotions
% 1 for collect, 2 for inspect, 3 for repair, 4 for clean.
ControlFunction();

% a2GUI;

