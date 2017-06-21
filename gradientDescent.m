function [ w ] = gradientDescent( X, y, w, iteration )
%%% Online gradient descent is used to learn parameters in order to fit a
%%% straight line to the points.
%%% Arguments:      1. Train Patterns
%%%                 2. Train Targets
%%%                 3. Weights
%%%                 4. Current iteration number
%%%
%%% Returns:        1. Updated Weights
%%%
%%% Note: I think this has some issues

    m = length(y);              % Number of training examples
    alpha = 2/iteration;        % Recalculate alpha every step

    error = (y - X*w);           
    
    for i =1:length(w)
        grad(i,1) = sum(error.*X(:,i));
    end
    
    w = w + (alpha/m)*grad;  % Update weights
 
end