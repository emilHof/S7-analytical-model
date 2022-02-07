classdef motherboard
    properties
        ram {mustBeNumeric}
        usb3 {mustBeNumeric}
        usb2 {mustBeNumeric}
        usbc {mustBeNumeric}
        hdmi {mustBeNumeric}
        pin40 {mustBeNumeric}
        lan {mustBeNumeric}
        cores {mustBeNumeric}
        clock {mustBeNumeric} %GHz
        currentIdle {mustBeNumeric} %mA
        currentMax {mustBeNumeric} %mA
        price {mustBeNumeric} %$
    end
    
    methods
        function obj = motherboard(ram, usb3, usb2, usbc, hdmi, pin40, lan, cores, clock, cIdle, cMax, price)
            if nargin == 12
                obj.ram = ram;
                obj.usb3 = usb3;
                obj.usb2 = usb2;
                obj.usbc = usbc;
                obj.hdmi = hdmi;
                obj.pin40 = pin40;
                obj.lan = lan;
                obj.cores = cores;
                obj.clock = clock;
                obj.currentIdle = cIdle;
                obj.currentMax = cMax;
                obj.price = price;
            end
        end
    end
end

