function convertRawDataToMat(fileName)
    %fileName = 'A22_temp_zaplonu.csv';
    dataType = 'DaneWalidacyjne';
    data = importdata(sprintf('../%s/%s', dataType, fileName), ';', 1);

    values = data.data;
    samplesCount = length(values);
    time = zeros(samplesCount, 1);

    TimeOrigin = datenum('20160101 000000','yyyymmdd HHMMSS'); %//This can stay the same, unless you want to change it for consistency.
    data.textdata = data.textdata(2:end, :); % remove text header
    for k = 1:samplesCount
        dateCell = data.textdata(k,1);
        timeCell = data.textdata(k,2);
        dateString = sprintf('%s %s', dateCell{1}, timeCell{1});
        InputDate = datenum(dateString,'mm/dd/yyyy HH:MM:SS');

        epochSeconds = round((InputDate-TimeOrigin)*86400);
        time(k) = epochSeconds;
    end

    timeWithoutOffset = time - time(1); % remove time start offset
    plot(time/(3600 * 24), values, 'o');

    xlabel('Time [days]');
    %ylabel('Ignition temperature [C]');
    ylabel(fileName);
    grid on;

    outputData = [time values];

    saveFileName = fileName(1:end-4); % remove CSV extension
    save(sprintf('../%s/MATLAB_mat/%s.mat',dataType,saveFileName), 'outputData');
end