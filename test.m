%% variables & component decleration
%radios
RFM96w433mhz = radio(1.2, 95, 16, 115.12);
xBeeProSX = radio(.0025, 55, 40, 120);

%motherboards
odroidC4 = motherboard(4, 2, 1, 0, 1, 1, 1, 4, 2.016, 157.33, 260, 50);
rockPro64 = motherboard(4, 1, 2, 1, 0, 1, 1, 6, 1.533, 185, 650, 80);
odroidN2plus = motherboard(4, 4, 0, 0, 1, 1, 1, 6, 2.667, 150, 516, 80);
pineRock64 = motherboard(2, 1, 2, 0, 0, 1, 1, 4, 1.100, 1.542, 129, 346, 55); 

newBattery = battery(1000, 50);
newDrive = hardDrive(256);
sensor1 = sensor(50, 16, 10);


