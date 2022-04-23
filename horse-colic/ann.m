% Targets and inputs
ds = table2array(cleanedhorsecolic);
ds = ds';
targets = ds(19,:);
inputs = ds([1:18,20],:); 

%%
% Setting up network
trainFcn = 'trainlm';
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize,trainFcn);

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train network
[net,tr] = train(net,inputs,targets);

% Test network
outputs = net(inputs);
errors  = gsubtract(targets, outputs);


% Performance
performance = perform(net, targets, outputs)
[X,Y,T,AUC] = perfcurve(targets,outputs,1);
AUC

%%
% Plots, uncomment to show plots
figure, plotperform(tr)
figure, plotconfusion(targets,outputs)
figure, plotroc(targets, outputs)