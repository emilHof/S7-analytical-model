classdef hardDrive
    properties
        capacity {mustBeNumeric} %MB
        stored {mustBeNumeric} %MB
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

