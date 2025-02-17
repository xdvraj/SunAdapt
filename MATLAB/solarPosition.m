function [altitude, azimuth] = solarPosition(latitude, dayOfYear, localHour)
    % Compute solar declination angle (in degrees)
    declination = 23.45 * sind((360/365) * (dayOfYear - 81));
    
    % Compute Hour Angle (in degrees) 
    hourAngle = 15 * (localHour - 12);
    
    % Solar altitude calculation
    altitude = asind( sind(latitude)*sind(declination) + ...
                      cosd(latitude)*cosd(declination)*cosd(hourAngle) );
    
    % Solar azimuth calculation (simplified, angle from North)
    azimuth = acosd((sind(declination) - sind(latitude)*sind(altitude)) / ...
                    (cosd(latitude)*cosd(altitude)));
end
