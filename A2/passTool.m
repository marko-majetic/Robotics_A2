function [] = passTool()

hold on;

fetch = Fetch(transl(0.75,3.5,0)*trotz(pi));
q0 = zeros(1,7);
fetch.model.animate(q0);


steps = 50;
ee_0 = fetch.model.fkine(q0);

ee_1 = transl(0.3,3,0.2); %toolbox pickup point

q1 = fetch.model.ikcon(ee_1);


pause(0.5);

moveMatrix1 = jtraj(q0,q1,steps);
            for i = 1:size(moveMatrix1)
                fetch.model.animate(moveMatrix1(i,:));
                drawnow();
                pause(0.01);
            end
            
ee_2 = transl(0,4.5,1.5); %drop off to irb point
q2 = fetch.model.ikcon(ee_2);

moveMatrix2 = jtraj(q1,q2,steps);
            for i = 1:size(moveMatrix2)
                fetch.model.animate(moveMatrix2(i,:));
                drawnow();
                pause(0.01);
            end
pause(1.0);

ee_3 = transl(-1,3.5,1);
q3 = fetch.model.ikcon(ee_3);

moveMatrix3 = jtraj(q2,q3,steps);
            for i = 1:size(moveMatrix3)
                fetch.model.animate(moveMatrix3(i,:));
                drawnow();
                pause(0.01);
            end
pause(1.0);




end

