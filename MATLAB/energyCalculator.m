function energy = energyCalculator(latitude, dayOfYear, tilt)
    % Use the solarPosition function at local noon (12 PM)
    [altitude, ~] = solarPosition(latitude, dayOfYear, 12);  % solar noon
    irradiance = 1000; % Assume 1000 W/m² for direct sunlight
    panelArea = 1.6;   % Panel area in m²
    efficiency = 0.18; % Panel efficiency (18%)
    
    % Calculate the effective irradiance based on the difference between tilt and altitude.
    % This is a simple model; a more refined model would integrate over the day.
    effectiveIrradiance = irradiance * cosd(tilt - altitude);
    
    % Daily energy output (in kWh) estimation:
    % Convert W to kW and multiply by hours of effective sunlight (~5 hrs/day average)
    energy = efficiency * panelArea * effectiveIrradiance * 5 / 1000;
end
