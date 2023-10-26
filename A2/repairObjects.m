classdef repairObjects
    methods(Static)
        function box1()
            surf([-2.5,-3.5;-2.5,-3.5]...
            ,[4.1,4.1;4.1,4.1]...
            , [2,2;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha',  'flat'...
            ,'FaceColor','white');
        
        surf([-2.5,-2.5;-2.5,-2.5]...
            ,[4.1,4;4.1,4]...
            , [2,2;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-2.5,-2.5;-3.5,-3.5]...
            ,[4.1,4;4.1,4]...
            , [3,3;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-3.5,-3.5;-3.5,-3.5]...
            ,[4.1,4;4.1,4]...
            , [2,2;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-2.5,-2.5;-3.5,-3.5]...
            ,[4.1,4;4.1,4]...
            , [2,2;2,2]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        end
        function box2()
            surf([-2.5,-3.5;-2.5,-3.5]...
            ,[4.1,4.1;4.1,4.1]...
            , [0,0;1,1]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-2.5,-2.5;-2.5,-2.5]...
            ,[4.1,4;4.1,4]...
            , [0,0;1,1]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-2.5,-2.5;-3.5,-3.5]...
            ,[4.1,4;4.1,4]...
            , [1,1;1,1]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-3.5,-3.5;-3.5,-3.5]...
            ,[4.1,4;4.1,4]...
            , [0,0;1,1]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        
        surf([-2.5,-2.5;-3.5,-3.5]...
            ,[4.1,4;4.1,4]...
            , [0,0;0,0]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','white');
        end
        function solarPanel()
            surf([-4.5,-4.5;-4.5,-4.5]...
            ,[4,5.2;4,5.2]...
            , [2,2;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','blue');
        
        surf([-4.7,-4.7;-4.7,-4.7]...
            ,[4,5.2;4,5.2]...
            , [2,2;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','blue');
        
        surf([-4.5,-4.7;-4.5,-4.7]...
            ,[4,4;5.2,5.2]...
            , [2,2;2,2]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','blue');
        
        surf([-4.5,-4.7;-4.5,-4.7]...
            ,[4,4;5.2,5.2]...
            , [3,3;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','blue');
        
        surf([-4.5,-4.7;-4.5,-4.7]...
            ,[5.2,5.2;5.2,5.2]...
            , [2,2;3,3]...
            ,'AlphaData', 1 ...
            ,'FaceAlpha', 'flat'...
            ,'FaceColor','blue');
        end
    end
end