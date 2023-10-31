function [] = CreateEnvironment()
axis equal;
view(3);
camlight;
hold on;


% table = PlaceObject('tableBrown2.1x1.4x0.5m.ply', [0,0,0]);
            % Create the Floor
            surf([-5,-5;5,5] ...
            ,[-5,4;-5,4] ...
            ,[0.01,0.01;0.01,0.01] ...
            ,'CData',imread('concrete.jpg') ...
            ,'FaceColor','texturemap');

            %Create the walls
            surf([-5,5;-5,5] ...
            ,[4,4;4,4] ...
            ,[0,0;4,4] ...
            ,'CData',imread('concrete.jpg') ...
            ,'FaceColor','texturemap');

            surf([-5,5;-5,5] ...
            ,[-5,-5;-5,-5] ...
            ,[0,0;4,4] ...
            ,'CData',imread('concrete.jpg') ...
            ,'FaceColor','texturemap');

            surf([5,5;5,5] ...
            ,[-5,4;-5,4] ...
            ,[0,0;4,4] ...
            ,'CData',imread('concrete.jpg') ...
            ,'FaceColor','texturemap');

            surf([-5,-5;-5,-5] ...
            ,[-5,4;-5,4] ...
            ,[0,0;4,4] ...
            ,'CData',imread('concrete.jpg') ...
            ,'FaceColor','texturemap');

            axis ([-5 5 -5 8 0 4])
%% Load Door into Matlab
door = PlaceObject('door.ply', [0,4,0]);
fireExt = PlaceObject('fireExtinguisher.ply', [4.9,1.5,1.5]);
% 
% door1 = PlaceObject('door2.ply', [0,4,0]);
curtain = PlaceObject('lightCurtain1.ply', [4.85,-2,0]);
curtain2 = PlaceObject('lightCurtain2.ply', [-4.85,-2,0]);

%% Load EStop
EStop = PlaceObject('emergencyStopButton.ply', [4,4,2]);
%% Load Screwdriver
screwdriver = PlaceObject('screwdriver.ply', [2.5,3.5,2]);
toolbox = PlaceObject('toolbox.ply', [2.5,3.5,0]);
broom = PlaceObject('broom.ply', [2.5,3.5,0]);
% set(EStop, 'Vertices', EStop_Vert(:,1:3));
% set(person, 'Vertices', person_Vert(:,1:3));
% EStop = EStop * troty(pi/2);
%% Load Cube
% cube = PlaceObject('cube.ply', [3,4.31,2]);


%% Load Fences
PlaceObject('barrier1.5x0.2x1m.ply', [0.75,0.8,0]);
PlaceObject('barrier1.5x0.2x1m.ply', [-0.75,0.8,0]);
% PlaceObject('barrier1.5x0.2x1m.ply', [0.75,-1.5,0]);
% PlaceObject('barrier1.5x0.2x1m.ply', [-0.75,-1.5,0]);
sideBarrier1 = PlaceObject('barrier1.5x0.2x1m.ply', [-3,1.5,0]);
sideBarrier2 = PlaceObject('barrier1.5x0.2x1m.ply', [-1.5,-1.5,0]);
sideBarrier3 = PlaceObject('barrier1.5x0.2x1m.ply', [-1.5,1.5,0]);
sideBarrier4 = PlaceObject('barrier1.5x0.2x1m.ply', [-3,-1.5,0]);

sideBarrier1_Vert = [get(sideBarrier1, 'Vertices'), ones(size(get(sideBarrier1,'Vertices'),1),1)] *trotz(pi/2);
set(sideBarrier1, 'Vertices', sideBarrier1_Vert(:,1:3));	

sideBarrier2_Vert = [get(sideBarrier2, 'Vertices'), ones(size(get(sideBarrier2,'Vertices'),1),1)] *trotz(pi/2);
set(sideBarrier2, 'Vertices', sideBarrier2_Vert(:,1:3));

sideBarrier3_Vert = [get(sideBarrier3, 'Vertices'), ones(size(get(sideBarrier3,'Vertices'),1),1)] *trotz(pi/2);
set(sideBarrier3, 'Vertices', sideBarrier3_Vert(:,1:3));	

sideBarrier4_Vert = [get(sideBarrier4, 'Vertices'), ones(size(get(sideBarrier4,'Vertices'),1),1)] *trotz(pi/2);
set(sideBarrier4, 'Vertices', sideBarrier4_Vert(:,1:3));
% %% Load Person into Matlab
% person = PlaceObject('personMaleConstruction.ply', [-0.9,1.8,0]);
% person_Vert = [get(person, 'Vertices'), ones(size(get(person,'Vertices'),1),1)] *trotz(pi);
% set(person, 'Vertices', person_Vert(:,1:3));