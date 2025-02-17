function shadowLength = shadowSimulator(objectHeight, sunAltitude)
    % Compute shadow length using basic trigonometry.
    shadowLength = objectHeight / tand(sunAltitude);
end
