function [ y ] = LR_predict( X, w )
%%% Predicts target values using pattern values and weights
%%% Arguments:      1. Pattern Values
%%%                 2. Weights
%%%
%%% Returns:        1. Predictions

y = X*w;

end

