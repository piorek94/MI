function [X, Y] = loadNNData(dataType)

    inputFiles = {'DR2.FC0206.PV', 'DR2.FC0211.PV', ...
        'DR2.TI0204.PV', 'DR2.TI0206.PV', 'DR2.TI0208.PV', ...
        'DR2.TI0240.PV', 'DR2.TI0250.PV', 'DR2.TI0265.PV'
    };
    %dataType = 'DaneWalidacyjne';

    inputsCount = 8;
    if strcmp(dataType, 'DaneUczace')
        inputLength = 8614;
        outputData = importdata(sprintf('../%s/MATLAB_mat/A22_temp_zaplonu_mod.mat', dataType));
        %outputData = importdata(sprintf('../%s/MATLAB_mat/A22_temp_zaplonu_selected_2.mat', dataType));
    else
       inputLength = 1151;
       outputData = importdata(sprintf('../%s/MATLAB_mat/A22_temp_zaplonu.mat', dataType));
    end
    inputData = zeros(inputLength, inputsCount+1); % inputs + timestamp


    % prepare input data in one matrix
    for k = 1:inputsCount
        fileName = inputFiles{k};
        input =  importdata(sprintf('../%s/MATLAB_mat/%s.mat', dataType, fileName));
        inputData(:, k+1) = input(:, 2);
    end
    inputData(:, 1) = input(:, 1); % copy timestamp

    trainingPointsCount = length(outputData);
    X = zeros(trainingPointsCount-1, inputsCount+1); % T_A22 + inputs
    Y = zeros(trainingPointsCount-1, 1);

    for k = 1:(trainingPointsCount-1)
       inputsK = zeros(1, inputsCount); % inputs at moment k
       inputsKp1 = zeros(1,inputsCount); % inputs at moment k+1
       timestampK = outputData(k,1);
       timestampKp1 = outputData(k+1, 1);
       for j = 1:inputsCount
           analysedInputData = [inputData(:,1) inputData(:, j+1)];
           inputsK(j) = calculateAverageInputValue(analysedInputData, timestampK, 3*3600);
           inputsKp1(j) = calculateAverageInputValue(analysedInputData, timestampKp1, 3*3600);
       end
       deltaInputs = inputsKp1 - inputsK;
       X(k, :) = [outputData(k,2) deltaInputs];
       Y(k) = outputData(k+1,2);
    end

end