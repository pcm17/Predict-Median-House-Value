function [ w ] = LR_solve( X, y )
%%% Calculates weight values using pattern values and targets
%%% Arguments:      1. Pattern Values
%%%                 2. Targets
%%%
%%% Returns:        1. Weights

    w = X \ y;
    
end

