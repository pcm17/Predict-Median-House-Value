function [] = scatter_plot( X1_vals, X2_vals, X1_name, X2_name )
%%% Plots two attributes in a scatter plot to see possible correlations
%%% Arguments:      1. First pattern values
%%%                 2. Second pattern values
%
%%% Returns: []
figure, scatter(X1_vals,X2_vals);
title([num2str(X1_name) ' vs ' num2str(X2_name)]);
end

