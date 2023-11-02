classdef robotMotions
    % These functions represent the tasks the robot can do
    % More complex tasks such as combinations of other tasks and in
    % different locations are also possible but are not included in the
    % demonstration for simplicity
    
    methods(Static)
        %% Base function
        % Returns robot to base-for rest 
        function base(robot)
            steps = 50;
            q1 = robot.model.getpos();
            q2 = [-0.01 0 0 0 0 0 0];
            qMatrix = jtraj(q1,q2,steps);
            for i = 1:size(qMatrix)
                robot.model.animate(qMatrix(i,:));
                drawnow();
                pause(0.01);
            end
        end

        %% Collect tool function
        % Places end effector where fetch can attach tools
        function collect(robot)
            steps = 50;
            q1 = robot.model.getpos();
            q2 = [-0.0100 90*pi/180 0 90*pi/180 0 0 0];
            qMatrix = jtraj(q1,q2,steps);
            for i = 1:size(qMatrix)
                robot.model.animate(qMatrix(i,:));
                drawnow();
                pause(0.01);
            end
        end
        %% Inspect function-
        % goes to inputted coorinates and takes a picture/uses a sensor to
        % gain information on the malfunctioning object

        %To do
        %-Collision avoidance
        function inspect(box, robot)
            if box == 1                                 %Top element
                position = [-3, 4.7, 2.5];
                robotMotions.move(position, robot);
            elseif box ==2                              %Bottom element
                position = [-3, 4.7, 0.5];
                robotMotions.move(position, robot);
            else
                disp('Error: unknown element');
            end

            pause(5);
            
            robotMotions.base(robot);                   %Return to base when finished
           
            disp('Inspection completed successfully');
        end

        %% Clean function
        % Goes to inputted coordinates and sweeps the area using brush
        function clean(robot)
            %Path to clean solar panel with a 20mm brush
            pos1 = [-4.38 4.1 2.1];
            pos2 = [-4.28 4.1 2.9];
            pos3 = [-4.38 4.3 2.9];
            pos4 = [-4.38 4.3 2.1];
            pos5 = [-4.38 4.5 2.1];
            pos6 = [-4.38 4.5 2.9];
            pos7 = [-4.38 4.7 2.1];
            pos8 = [-4.38 4.7 2.9];
            pos9 = [-4.38 4.9 2.1];
            pos10 = [-4.38 4.9 2.9];
            pos11 = [-4.38 5.1 2.1];
            pos12 = [-4.38 5.1 2.9];

            %Concatenate path into one matrix
            position = [pos1; pos2; pos3; pos4; pos5; pos6; pos7; pos8; pos9; pos10; pos11; pos12];

            for i = 1:12
                robotMotions.move(position(i, :), robot);   %Cycle through matrix
            end

            robotMotions.base(robot);

            disp('Cleaning operation completed successfully')
        end

        %% Repair function
        %Goes to inputted coordinates and uses the tool to repair 
        % Task 1 = screw in bolts on the 4 corners of the object
        % Task 2 = weld around the outside of the object

        %To do
        %-Collision avoidance
        function repair(box, task, robot)
            if task == 1
                if box == 1                                 %Top element
                    bolt1 = [-2.6 4.2 2.9];
                    bolt2 = [-3.4 4.2 2.9];                
                    bolt3 = [-3.4 4.2 2.1];
                    bolt4 = [-2.6 4.2 2.1];
                elseif box == 2                             %Bottom element
                    bolt1 = [-2.6 4.2 0.9];
                    bolt2 = [-3.4 4.2 0.9];                
                    bolt3 = [-3.4 4.2 0.1];
                    bolt4 = [-2.6 4.2 0.1];
                else
                    disp('Error: Unknown element')
                end

                %Move to each location and then screw in the bolt
                robotMotions.move(bolt1, robot);
                robotMotions.screw(robot);
                robotMotions.move(bolt2, robot);
                robotMotions.screw(robot);
                robotMotions.move(bolt3, robot);
                robotMotions.screw(robot);
                robotMotions.move(bolt4, robot);
            elseif task == 2
                if box == 1                             
                    pos1 = [-2.5 4.1 3];
                    pos2 = [-3.5 4.1 3];
                    pos3 = [-3.5 4.1 2];
                    pos4 = [-2.5 4.1 2];
                    pos5 = [-2.5 4.1 3];
                elseif box == 2
                    pos1 = [-2.5 4.1 1];
                    pos2 = [-3.5 4.1 1];
                    pos3 = [-3.5 4.1 0];
                    pos4 = [-2.5 4.1 0];
                    pos5 = [-2.5 4.1 1];
                end
                path = [pos1;pos2;pos3;pos4;pos5];

                for i = 1:5
                    robotMotions.move(path(i,:), robot);
                end
            else
                disp('Error: Unknown task')
            end
           
            robotMotions.base(robot);

            disp('Repair operation completed successfully');
        end

        %% Screw function
        % Used to screw in bolts/screws
        % Rotates end effector in 10 degree intervals 20 times
        function screw(robot)
            q = robot.model.getpos();
            for i=0:10:200
                robot.model.animate([q(1,1:6) i]);
            end
        end

        %% Move function
        % This function drive the movement of the robot using RMRC with
        % damped least squares to avoid singularities

        % Finish is the end position of the movement
        % The starting position is wherever the robot currently is
        function move(finish, robot)
            steps = 50;
            deltaT = 0.05;                                      %Time step
            M = [1 1 1 0 0 0];                                  %Masking matrix
            lambda = 0.1;                                       %Lambda for damped least squares
            
            q1 = robot.model.getpos();                          %Find current joint position
            pos1 = robot.model.fkine(q1);                       %Find current end effector position
            x1 = pos1.t;
            T1 = [eye(3) [x1]; zeros(1,3) 1];
            x2 = finish';

            x = zeros(3,steps);                 
            s = lspb(0,1,steps);                                %Create interpolation scalar
            for i = 1:steps
                x(:,i) = x1*(1-s(i)) + s(i)*x2;                 %Create trajectory
            end
            
            qMatrix = nan(steps,7);

            q = [-1 0 -40*pi/180 160*pi/180 0 -30*pi/180 0];    %Initial guess for ikine
            qMatrix(1,:) = robot.model.ikine(T1, 'q0', q, 'mask', M);
            xdot = nan(3, steps);
            
            for i = 1:steps-1
                xdot = (x(:,i+1) - x(:,i))/deltaT;              %Calculate velocity at discrete time step
                J = robot.model.jacob0(qMatrix(i,:));           %Get the Jacobian at the current state
                J = J(1:3,:);                                   %Take only first 3 rows
                Jinv_dls = inv((J'*J)+lambda^2*eye(7))*J';      %Calculate damped least squares
                qdot = Jinv_dls*xdot;                           %Solve velocities via RMRC
                qMatrix(i+1,:) =  qMatrix(i,:) + deltaT*qdot';  % Update next joint state
            end
            
            for i = 1:size(qMatrix)                             %Cycle through movement matrix to move the robot
                robot.model.animate(qMatrix(i,:));
                drawnow();
                pause(0.01);
            end
        end
    end
end