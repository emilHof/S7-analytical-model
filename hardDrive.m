classdef hardDrive
    properties
        capacity {mustBeNumeric} %GB
    end
    
    methods
        %constructor
        function obj = hardDrive(cap)
            if nargin == 1
                obj.capacity = cap;
            end
        end
    end
end

