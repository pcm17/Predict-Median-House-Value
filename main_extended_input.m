%%% Experiments with predicting median house value using linear regression 
%%% with online gradient descent and extended input
%%% ****************************************************************
%%% Peter McCloskey
%%% CS 1675 Intro to Machine Learning, University of Pittsburgh 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MAJOR PROBLEMS HERE
% I had a lot of trouble with this problem. Does the dimensionality for the
% weights vector change when the input is extended? I'm so
% confused!!
%
% Answer:       Yes, the dimensionality increases when the input is
%               extended. 
data_train = load('data/housing_train.txt');
data_test = load('data/housing_test.txt');

numFeatures = 13;
iterations = 2;

x_train = data_train(:, 1:numFeatures);
x_train = [x_train ; x_train; x_train]; % Duplicate training data to run more than 1000 steps
y_train = data_train(:, (numFeatures+1));
y_train = [y_train ; y_train; y_train];  % Duplicate training data to run more than 1000 steps

x_test = data_test(:,1:numFeatures);
y_test = data_test(:,(numFeatures+1));

x_train = normalize(x_train);   % Normalize input
x_test = normalize(x_test);     % Normalize input

phi_X = zeros(size(x_train));   % Initialize array that will hold the extended input

for i = 1:size(x_train,1)
    phi_X(i,:) = extendx(x_train(i,:)); % Extend the input
end

phi_X = [ones(size(phi_X,1),1) phi_X]; % Add a col of 1's for the x0 terms
x_test = [ones(size(x_test,1),1) x_test]; % Add a col of 1's for the x0 terms


weights = zeros(size(phi_X,2),1);
 % Perform Online Gradient Descent
for iteration = 1:iterations
    [weights] = gradientDescent(phi_X, y_train, weights, iteration);
end

% Make predictions and report MSE for training
y_pred_train = phi_X*weights;
mse_train = immse(y_train, y_pred_train);

% Make predictions and report MSE for test
y_pred_test = x_test*weights;
mse_test = immse(y_test, y_pred_test);

% Display results
fprintf('MSE Training = %.2f\n',mse_train);
fprintf('MSE Test = %.2f\n',mse_test);

