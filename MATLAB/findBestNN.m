[X, Y] = loadNNData('DaneWalidacyjne');
Xvalid = {X(:,1)'; X(:,2)'; X(:,3)'; X(:,4)'; X(:,5)'; X(:,6)'; X(:,7)'; X(:,8)'; X(:,9)';};
Yv = Y;

validationMethod = 'trainData';
%validationMethod = 'validationData';
best_vperf = 9999999999999;
iter = 0;
h = waitbar(0, 'Searching for best NN...');
K_min = 1; K_max = 3; iter_max = 100;
for k = K_min:K_max
   for i = 1:iter_max
      K = k;
      trainNeuralNetwork;
      E = 999999999999;
      if strcmp(validationMethod, 'trainData')
          E = tr.best_vperf;
      elseif strcmp(validationMethod, 'validationData')
          ymod_valid=sim(nn,Xvalid);
          E = (ymod_valid{1}' - Yv)'*(ymod_valid{1}' - Yv);
      end
      iter = iter+1;
      waitbar(iter/((K_max-K_min+1)*iter_max));
      if(E < best_vperf)
         best_vperf = E;
         best_nn = nn;
         best_K = K;
      end
   end
end
close(h);