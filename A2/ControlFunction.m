%CreateEnvironment();                             %Generate the environment
%repairObjects.box1();                            %Generate the objects that the robot interacts with
%repairObjects.box2();
%repairObjects.solarPanel();

ARB = IRB1660ID(transl(-2, 4, 1.6));             %Call the robot
ARB.model.animate([-0.01 0 0 0 0 0 0]);          %Set in base position

%Enter the number of the operation. i.e. 1 for collect, 2 for inspect
selection = input('Which operation is needed?\n 1. Collect tool from fetch \n 2. Inspect object \n 3. Repair object \n 4. Clean solar panel\n');

switch selection
    case 1
        robotMotions.collect(ARB);
    case 2
        object = input('Which object would you like to inspect?\n 1. Top element\n 2. Bottom element\n');
        if object <1 && object > 2
            disp('Error: Unkown object')
        end
        robotMotions.inspect(object, ARB);
    case 3
        task = input('Which task would you like to perform?\n 1. Screw\n 2. Welding\n');
        if task <1 && task > 2
            disp('Error: Unkown task')
        end
        object = input('Which object would you like to repair?\n 1. Top element\n 2. Bottom element\n');
        if object <1 && object > 2
            disp('Error: Unkown object')
        end
        robotMotions.repair(object, task, ARB);
    case 4
        robotMotions.clean(ARB);
    otherwise
        disp('Error: Unknown operation')
end
