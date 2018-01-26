function u = calculateAverageInputValue(inputData, measurementTimestamp, averagePeriod) % timestamps in seconds, averagePeriod in seconds
    inputLength = length(inputData);
    sum = 0;
    samplesSummed = 0;
    minTimestamp = measurementTimestamp - averagePeriod;
    maxTimestamp = measurementTimestamp;
    for k = 1:inputLength
        sampleTimestamp = inputData(k,1);
        if((sampleTimestamp >= minTimestamp) && (sampleTimestamp <= maxTimestamp))
            sum = sum + inputData(k,2);
            samplesSummed = samplesSummed + 1;
        end
    end
    u = 0;
    if(samplesSummed ~= 0)
        u = sum / samplesSummed;
    else
        disp('Error, could not find samples to calculate avg!');
    end
end