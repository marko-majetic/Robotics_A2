classdef IRB1660ID < RobotBaseClass
    properties(Access = public)
        plyFileNameStem = 'IRB1660ID';
    end

    methods
        %Constructor
        function self = IRB1660ID(baseTR, useTool, toolFileName)
            if nargin < 3
                if nargin == 2
                    error('If you set useTool, you must pass in a tool file name');
                elseif nargin == 0 %Nothing passed
                    baseTR = transl(0,0,0);
                end
            else
                self.useTool = useTool;
                toolTrData = load([toolFileName, '.m']);
                self.toolTr = toolTrData.tool;
                self.toolFilename = [toolFileName, '.ply'];
            end

            self.CreateModel();
            self.model.base = self.model.base.T *baseTR * trotx(pi/2) * troty(pi/2);
            self.model.tool = self.toolTr;
            self.PlotAndColourRobot();

        end

        %Create model
        function CreateModel(self)
              link(1) = Link([pi     0       0       pi/2    1]); %Prismatic joint
              link(2) = Link([0     0.4865       0.15       -pi/2    0]);
              link(3) = Link([pi/2     0       0.7       0    0]);
              link(4) = Link([0     0       0.11       pi/2    0]);
              link(5) = Link([0     0.678       0       -pi/2    0]);
              link(6) = Link([0     0       0       pi/2    0]);
              link(7) = Link([0     0       0       0    0]);

               link(1).qlim = [-3 -0.01];
            link(2).qlim = [-180 180]*pi/180;
            link(3).qlim = [-90 150]*pi/180;
            link(4).qlim = [-238 79]*pi/180;
            link(5).qlim = [-175 175]*pi/180;
            link(6).qlim = [-120 120]*pi/180;
            link(7).qlim = [-400 400]*pi/180;

            self.model = SerialLink(link, 'name', self.name);
        end
    end
end