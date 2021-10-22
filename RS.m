%random search --- symbolic regression 

function [error_history,Eqn_fit]=RS(num_eval,tree_depth)

    % load the actual data from text file
    D = importdata('data.txt');
    data_x = D(:,1);
    data_y = D(:,2);
    figure(1)
    plot(data_x,data_y)
    hold on

    num_eval = num_eval;
    error_fit = 1e8;
    for i = 1 : num_eval
        i
   

        heap = generating_random_heap(tree_depth);
        str_expression = heap2expression(heap,tree_depth);

        %calculate the approximation error 
        fitness_error = calculate_fitness_error(str_expression,data_x,data_y);
   

        %random search comparison
        if fitness_error < error_fit
           best_fit_eqn = str_expression;
           error_fit = fitness_error;

    %        %plot 
    %        figure(1)
    %        fplot(best_fit,[0,20])
    %        ylim([-2,20])
    %        legend('Approximation','True')
    %        title(str_expression)
        end

        error_history(i)=error_fit;

    end 

    figure(1)
    fplot(best_fit_eqn,[0,20])
    ylim([-2,20])
    legend('True','Approximation')

    figure(2)
    plot(1:num_eval,error_history)
    xlabel('# of evaluations')
    ylabel('fitting error')
    title('Learning Curve')
    
    Eqn_fit = best_fit_eqn;
 
end 