function [ phi_X ] = extendx( X )
%%% Takes a vector X and returns all linear and degree 2 polynomials
%%% Arguments:      1. Patterns
%%%
%%% Returns:        1. Extended Patterns
%%% Dont think this works properly

    phi_X = zeros(size(X));
    %phi_X = X;
    m = size(X,2); % Number of columns (attributes) in X
    for i = 1:m
        for j = i:m
            phi_X(1,i) = phi_X(1,i) + X(i)*X(j);
        end
    end
end

