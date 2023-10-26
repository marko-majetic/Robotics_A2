classdef robotMotions
    methods(Static)
        %% Base function
        % Returns robot to base-for rest 
        function base()
            steps = 50;
            q1 = ARB.model.getpos();
            q2 = [-0.01 0 0 0 0 0 0];
            qMatrix = jtraj(q1,q2,steps);
            ARB.model.animate(qMatrix);
        end

        %% Collect tool function
        % PLaces end effector where fetch can attach tools
        function collect()
            steps = 50;
            q1 = ARB.model.getpos();
            q2 = [-0.0100 90*pi/180 0 90*pi/180 0 0 0];
            qMatrix = jtraj(q1,q2,steps);
            for i = 1:size(qMatrix)
                ARB.model.animate(qMatrix(i,:));
                drawnow();
                pause(0.01);
            end
        end
        %% Inspect function-
        % goes to inputted coorinates and takes a picture/uses some sensor

        %To do
        %-Work out what sensor we are using
        %-Collision avoidance
        %-Make sure the camera is far enough away from the spot to take a
        %picture
        %-Use preset points like the transformer is broken, inspect
        %that(easier to make sure the camera or whatever can actually see
        %it
        function inspect()
            steps = 50;

            q = [-1 0 -40*pi/180 160*pi/180 0 -30*pi/180 0];

            q1 = robot.model.getpos();
            q2 = robot.model.ikine(transl(-3, 4.7, 2.5)*trotz(pi/2), 'q0', q, 'mask', [1 1 1 1 1 1]);
            qMatrix = jtraj(q1,q2,steps);

            for i = 1:size(qMatrix)
                ARB.model.animate(qMatrix(i,:));
                drawnow();
                pause(0.01);
            end

            %Whatever code we need for a camera?
            %Like 
            % ABS.tool = camera
            %ABS.tool = on
            %Return success message

            robotMotions.base(); 
           
            disp('Inspection completed successfully');
        end

        %% Clean function
        % Goes to inputted coordinates and sweeps the area using brush
        function clean()
            cleaningPoints1 = [-1.0089   -1.1583    0.0903    1.6509         0         0         0];
            cleaningPoints2 = [  -1.8331   -0.3724    0.1348    1.5590         0         0         0];
            cleaningPoints3 = [-1.7591   -0.4175   -0.1131    1.4728         0         0         0];
            cleaningPoints4 = [ -0.9734   -1.1676   -0.1466    1.5403         0         0         0];
            cleaningPoints5 = [  -1.0729   -1.1405   -0.3875    1.4265         0         0         0];
            cleaningPoints6 = [-2.0507   -0.2310   -0.3677    1.3865         0         0         0];
    
            cleaningPath1 = jtraj(q, cleaningPoints1, steps);
            for i = 1:size(cleaningPath1)
                robot.model.animate(cleaningPath1(i,:));
                drawnow()
                pause(0.01);
            end

            cleaningPath2 = jtraj(cleaningPoints1, cleaningPoints2, steps);
            for i = 1:size(cleaningPath2)
                robot.model.animate(cleaningPath2(i,:));
                drawnow()
                pause(0.01);
            end

            cleaningPath3 = jtraj(cleaningPoints2, cleaningPoints3, steps);
            for i = 1:size(cleaningPath3)
                robot.model.animate(cleaningPath3(i,:));
                drawnow()
                pause(0.01);
            end

            cleaningPath4 = jtraj(cleaningPoints3, cleaningPoints4, steps);
            for i = 1:size(cleaningPath4)
                robot.model.animate(cleaningPath4(i,:));
                drawnow()
                pause(0.01);
            end

            cleaningPath5 = jtraj(cleaningPoints4, cleaningPoints5, steps);
            for i = 1:size(cleaningPath5)
                robot.model.animate(cleaningPath5(i,:));
                drawnow()
                pause(0.01);
            end

            cleaningPath6 = jtraj(cleaningPoints5, cleaningPoints6, steps);
            for i = 1:size(cleaningPath6)
                robot.model.animate(cleaningPath6(i,:));
                drawnow()
                pause(0.01);
            end
        end

        %% Repair function
        %Goes to inputted coordinates and uses the tool to repair 

        %To do
        %-work out how to use the tool
        %-Collision avoidance
        %-Preset points to repair
        %-If welding maybe trace a square around the object
        function repair()
            steps = 50;

            q1 = ARB.model.getpos();

            bolt1 = [-0.6   -0.0000   -0.1614    2.1912   -0.0000   -0.4542   -0.0000];
            bolt2 = [-1.4   -0.0000   -0.1614    2.1912   -0.0000   -0.4542   -0.0000];
            bolt3 = [-0.6    0.0000   -0.5864   -2.5211    0.0000   -1.5282   -0.0000];
            bolt4 = [-1.4    0.0000   -0.5864   -2.5211    0.0000   -1.5282   -0.0000];

            bolt1Path = jtraj(q1, bolt1, steps);
            for i = 1:size(qMatrix)
                ARB.model.animate(bolt1Path(i,:));
                drawnow();
                pause(0.01);
            end
            robotMotions.screw();
            bolt2Path = jtraj(bolt1, bolt2, steps);
            for i = 1:size(qMatrix)
                ARB.model.animate(bolt2Path(i,:));
                drawnow();
                pause(0.01);
            end
            robotMotions.screw();
            bolt3Path = jtraj(bolt2, bolt3, steps);
            for i = 1:size(qMatrix)
                ARB.model.animate(bolt3Path(i,:));
                drawnow();
                pause(0.01);
            end
            robotMotions.screw();
            bolt4Path = jtraj(bolt3, bolt4, steps);
            for i = 1:size(qMatrix)
                ARB.model.animate(bolt4Path(i,:));
                drawnow();
                pause(0.01);
            end
            robotMotions.screw();

            robotMotions.base();

            display('Inspection completed successfully');
        end
        function screw()
            q = ARB.model.getpos()
            for i=0:10:200
                ARB.model.animate([q(1,1:6) i]);
            end
        end
    end
end