function [bestTilt, bestEnergy] = autoTilt_bruteforce(latitude, dayOfYear)
    tiltAngles = 0:1:90; % Search tilt angles from 0 to 90 degrees
    energyVals = arrayfun(@(t) energyCalculator(latitude, dayOfYear, t), tiltAngles);
    [bestEnergy, idx] = max(energyVals);
    bestTilt = tiltAngles(idx);
end
