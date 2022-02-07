classdef radio < matlab.System
    properties
        currentIdle {mustBeNumeric} %mA
        currentTrans {mustBeNumeric} %mA
        currentListen {mustBeNumeric} %mA
        maxTransRate {mustBeNumeric} %kbps
    end
    methods
        %constructor
        function obj = radio(cIdle, cTrans, cListen, maxTR)
            if nargin == 3
                obj.currentIdle = cIdle;
                obj.currentTrans = cTrans;
                obj.currentListen = cListen;
                obj.maxTransRate = maxTR;
            end
        end
    end
end
