%%% Experiments with predicting median house value using linear regression 
%%% ****************************************************************
%%% Peter McCloskey
%%% CS 1675 Intro to Machine Learning, University of Pittsburgh 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_train = load('data/housing_train.txt');
data_test = load('data/housing_test.txt');

X_train = data_train(:,1:13);
y_train = data_train(:,14);

X_test = data_test(:,1:13);
y_test = data_test(:,14);

w = LR_solve(X_train, y_train); % Calculate weights

y_predict_train = LR_predict(X_train, w);   % Make predictions for training data
y_predict_test = LR_predict(X_test, w);     % Make predictions for test data

mse_train = immse(y_train, y_predict_train);    % Calculate Mean Squared Error
mse_test = immse(y_test, y_predict_test);       % Calculate Mean Squared Error

% Display results
fprintf('MSE Training = %.2f\n',mse_train);
fprintf('MSE Test = %.2f\n',mse_test);