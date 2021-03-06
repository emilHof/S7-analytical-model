classdef battery < matlab.System
    properties
        capacity {mustBeNumeric} %mAh
        maxCurrent {mustBeNumeric} %mA
    end
    methods
        %constructor
        function obj = battery(cap, mxCrnt)
            obj.capacity = cap;
            obj.maxCurrent = mxCrnt;
        end
    end
end
