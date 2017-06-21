%%% Experiments with predicting median house value using linear regression 
%%% with online gradient descent
%%% ****************************************************************
%%% Peter McCloskey
%%% CS 1675 Intro to Machine Learning, University of Pittsburgh 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% I think there are some major errors in here 
data_train = load('data/housing_train.txt');
data_test = load('data/housing_test.txt');

numFeatures = 13;

X_train = data_train(:, 1:numFeatures);
X_train = [X_train ; X_train; X_train];     % Duplicate training data to run more than 1000 steps
y_train = data_train(:, (numFeatures+1));
y_train = [y_train ; y_train; y_train];     % Duplicate training data to run more than 1000 steps

X_test = data_test(:,1:numFeatures);
y_test = data_test(:,(numFeatures+1));


numIters = 100;

% Do you want feature normalization?
normalization = true;

if (normalization)
    X_train = normalize(X_train);       % Normalize input
    X_test = normalize(X_test);         % Normalize input
   
end

X_train = [ones(size(X_train,1),1) X_train];    % Add a col of 1's for the x0 terms
X_test = [ones(size(X_test,1),1) X_test];       % Add a col of 1's for the x0 terms
w = zeros(size(X_train,2),1);                   % Initialize weights to zero
pgraph = init_progress_graph;                   % Initialize graph
 
for iteration = 1:numIters
    w = gradientDescent(X_train, y_train, w, iteration);
    
    if mod(iteration,50) == 0                   % Plot progress
        y_train_pred = X_train*w;
        traine = immse(y_train, y_train_pred);
        y_test_pred = X_test*w;
        teste = immse(y_test, y_test_pred);
        pgraph = add_to_progress_graph(pgraph, iteration, traine, teste);
    end
end
%%
y_predict_train = LR_predict(X_train, w);   % Make predictions for training data
y_predict_test = LR_predict(X_test, w);     % Make predictions for test data

mse_train = immse(y_train, y_predict_train);    % Calculate Mean Squared Error
mse_test = immse(y_test, y_predict_test);       % Calculate Mean Squared Error

% Display results
fprintf('MSE Training = %.2f\n',mse_train);
fprintf('MSE Test = %.2f\n',mse_test);




