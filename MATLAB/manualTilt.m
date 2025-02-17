function optimalTilt = manualTilt(latitude, month)
    % Define offset for each month (1=Jan, 12=Dec). Customize these values.
    monthly_offset = [10, 8, 5, 2, 0, -2, -3, -2, 0, 2, 5, 8];  
    if month < 1 || month > 12
        error('Month must be between 1 and 12');
    end
    optimalTilt = latitude + monthly_offset(month);
end
