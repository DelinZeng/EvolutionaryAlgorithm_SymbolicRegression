clear all
close all

num_runs = 1;
num_eval = 10000;
tree_depth = 8;

% %Random Search
% for i = 1 : num_runs
%     
%     [error_history, Eqn_fit] = RS(num_eval,tree_depth);
%     fname = sprintf('RS%d.mat', 3);
%     save(fname,'error_history','Eqn_fit')
%     
% end




[error_history,Eqn_fit] = RMHC(10000,7,50)
    
    