function staticCharacteristic = calculateStaticCharacteristic(T_A22, input)
    staticPoints = length(T_A22);
    staticCharacteristic = zeros(staticPoints, 2); % T_A22; TI0206

    for j = 1:staticPoints
        measurementTimestamp = T_A22(j,1);
        staticCharacteristic(j,1) = T_A22(j,2);
        staticCharacteristic(j,2) = calculateAverageInputValue(input, measurementTimestamp, 5*60*60); % average 5 hours before measurement
    end
end