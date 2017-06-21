
function [pgraph] = add_to_progress_graph(pgraph, step, traine, teste)
%%% Graphs the progress of the mean train and test errors for iterative procedures
%%% Arguments: 1. Graph structure
%%%            2. Step number
%%%            3. Train error
%%%            4. Test error
%%%
%%% Returns:   1. Updated graph structure

pgraph.step=[pgraph.step step];
pgraph.train=[pgraph.train traine];
pgraph.test=[pgraph.test teste];
plot(pgraph.step,pgraph.train,'-b');
hold on;
plot(pgraph.step,pgraph.test,'--r');
xlabel('Step');
ylabel('Mean squared error');
title('(Progress of mean errors)') %title
legend('Train set','Test set') %label of the graph
pause(pgraph.pause);
hold off;
end

 