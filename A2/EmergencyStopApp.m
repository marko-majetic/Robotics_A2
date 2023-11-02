classdef EmergencyStopApp < matlab.apps.AppBase


function createComponents(app)
   % Example creating a button:
        app.StopButton = uibutton(app.UIFigure, 'push', ...
            'Text', ['EMERGENCY STOP'], ...
            'InnerPosition', [Xpos, Ypos, Width, Height], ...
            'ButtonPushedFcn', @(btn, event) stopRobot(app));
end

function stopRobot(app)
     app.RobotObj.eStop();
end

function app = EmergencyStopApp(robotObj, robotName)
      % Store robot object and name
      app.RobotObj = robotObj;
      app.RobotName = robotName;
            
      % Create and configure components
      createComponents(app);
end