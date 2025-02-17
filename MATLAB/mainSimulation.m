clc; clear; close all;

latitude = 22.0225;       
longitude = 72.5714;      
dayOfYear = 62;          
localHour = 13;    

[altitude, azimuth] = solarPosition(latitude, dayOfYear, localHour);
fprintf('Solar Altitude: %.2f°, Azimuth: %.2f°\n', altitude, azimuth);

treeHeight = 10;  
shadowLen = shadowSimulator(treeHeight, altitude);
fprintf('For a %.1f m tree, Shadow Length: %.2f meters\n', treeHeight, shadowLen);

manualTiltAngle = manualTilt(latitude, 6);
fprintf('Manual Tilt %.2f°\n', manualTiltAngle);

manualEnergy = energyCalculator(latitude, dayOfYear, manualTiltAngle);
fprintf('Estimated Energy Output (Manual Tilt): %.2f kWh/day\n', manualEnergy);

[optimalAutoTilt, optimalAutoEnergy] = autoTilt_bruteforce(latitude, dayOfYear);
fprintf('Optimal Auto Tilt: %.2f°, Energy: %.2f kWh/day\n', optimalAutoTilt, optimalAutoEnergy);

tiltAngles = 0:1:90;
energyValues = arrayfun(@(t) energyCalculator(latitude, dayOfYear, t), tiltAngles);
figure;
plot(tiltAngles, energyValues, 'LineWidth', 2);
xlabel('Tilt Angle (°)');
ylabel('Daily Energy Output (kWh)');
title('Energy Output vs. Tilt Angle');
grid on;
