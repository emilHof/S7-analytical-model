classdef sensor
    properties
        sampleRate {mustBeNumeric} %Hz
        resolution {mustBeNumeric} %bits
        currentDraw {mustBeNumeric} %mA
    end
    
    methods
        %constructor
        function obj = sensor(sRate, res, cDraw)
            if nargin == 2
                obj.sampleRate = sRate;
                obj.resolution = res;
                obj.currentDraw = cDraw;
            end
        end
    end
end

