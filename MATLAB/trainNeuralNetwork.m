[X, Y] = loadNNData('DaneUczace');

Xc = {X(:,1)'; X(:,2)'; X(:,3)'; X(:,4)'; X(:,5)'; X(:,6)'; X(:,7)'; X(:,8)'; X(:,9)';};

K = 5;
nn=feedforwardnet(K,'trainlm');

nn.performFcn ='sse';
nn.trainParam.show = 10;
nn.trainParam.showCommandLine = 1;
nn.trainParam.epochs = 500;
nn.trainParam.goal = 0.001;
nn.trainParam.showWindow = 1;
nn.numInputs = 9;
nn.inputConnect = [ones(1,9); zeros(1,9)];
nn.divideFcn = 'dividerand';
nn.divideParam.trainRatio = 0.9;
nn.divideParam.valRatio = 0.1;
nn.divideParam.testRatio = 0.00;

% nn.divideFcn = 'divideind';
% nn.divideParam.trainInd = [1:length(Y)];
% nn.divideParam.valInd = [];
% nn.divideParam.testInd = [];

[nn,tr]=train(nn,Xc,Y');