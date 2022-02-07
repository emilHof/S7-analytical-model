classdef sensor
    properties
        sampleRate {mustBeNumeric} %Hz
        resolution {mustBeNumeric} %bits
        currentDraw {mustBeNumeric} %mA
    end
    
    methods
        %constructor
        function obj = sensor(sRate, res, cDraw)
            if nargin == 3
                obj.sampleRate = sRate;
                obj.resolution = res;
                obj.currentDraw = cDraw;
            end
        end
    end
end

