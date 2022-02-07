%% variables & component decleration
% radios
RFM96w433mhz = radio(1.2, 95, 16, 115.12);
xBeeProSX = radio(.0025, 55, 40, 120);

% motherboards
odroidC4 = motherboard(4, 2, 1, 0, 1, 1, 1, 4, 2.016, 157.33, 260, 50);
rockPro64 = motherboard(4, 1, 2, 1, 0, 1, 1, 6, 1.533, 185, 650, 80);
odroidN2plus = motherboard(4, 4, 0, 0, 1, 1, 1, 6, 2.667, 150, 516, 80);
pineRock64 = motherboard(2, 1, 2, 0, 0, 1, 1, 4, 1.542, 129, 346, 55);

% sensors
gps = sensor(1, 9600, 25);
salinity = sensor(.008, 9600, 10);

% battery
batter100 = battery(100, 0);
battery500 = battery(500, 0);
battery1000 = battery(1000, 0);

% hard drive
newDrive = hardDrive(256);

%% calculations

t_1 = 1; % 24 hrs

% convert to seconds
t_s = t_1 * 60 * 60;

data_tIn = t_s * (gps.resolution * gps.sampleRate + salinity.resolution * salinity.sampleRate) / 8 / 1000000 %MB

data_tOut = t_s * xBeeProSX.maxTransRate / 8 / 1000 %MB

%% simulation
% we simulate an operational day of the buoy
% the sensors run continuously and the radio wakes every 1 hr to empty the
% hard drive
% to find the total current draw over the entire 24 hours we calculate it
% for 1 hr and then multiply the total by 24

% set time parameter
t_total = 24; % hrs
t_intr = 1; % this denotes the time interval for which we will be calculating the current draw
t_intr_s = t_intr * 60 * 60; % this is the time interval but converted to seconds

% to find the amount of data collected over one hour we use the data in
% value from the calculations
data = t_intr_s * (gps.resolution * gps.sampleRate + salinity.resolution * salinity.sampleRate) / 1000; % kb

% to find the current drawn by the sensors over one hour we use this
% function
currentSensors_intr = (gps.currentDraw + salinity.currentDraw) * t_intr; % mAh

% to find the current draw of the radio we calculate how long it would take
% to empty the drive after one hour and multiply that value by the sending current
% draw of the radio 
% we then add that value to the idle current draw of the radio multiplied
% by the remaining time in an hour
radioOnTime = data / xBeeProSX.maxTransRate; % s
radioOnTime_hr = radioOnTime / 60 / 60; % hrs
currentRadioSending_intr = xBeeProSX.currentTrans * radioOnTime_hr; % mAh
currenRadiotIdle_intr = xBeeProSX.currentIdle * (t_intr - radioOnTime_hr); % mAh

% to find the current drawn by the motherboard over that hour we multiply
% its max current draw by the sending time interval and its idle current
% draw by the remaining interval time
% we then add those values
currentMotherboardSending_intr = odroidN2plus.currentMax * radioOnTime_hr; % mAh
currentMotherbaordIdle_intr = odroidN2plus.currentIdle * (t_intr - radioOnTime_hr); % mAh

% now we can calculate the total current draw over one time interval by
% adding all the current draw values
currentTotal_intr = currentSensors_intr + currentRadioSending_intr + currenRadiotIdle_intr + currentMotherboardSending_intr + currentMotherbaordIdle_intr %mAh

% to get the total discharge of the battery over the whole time period we
% multiply the interval total by the whole time
chargeLost = @(t) currentTotal_intr * t; %mAh

% now we plot this function
fplot(chargeLost, [0 t_total])
grid on
title('charge used over time')
xlabel('time (hr)')
ylabel('charge capacity lost (mAh)')









