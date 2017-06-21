function [ X ] = normalize( X )
%%% Normalizes pattern values and returns the normalized data
%%% Arguments:      1. Unnormalized patterns
%%%
%%% Returns:        1. Normalized patterns
mu = mean(X);
stddev = std(X);
X = (X-mu)./stddev;
end

