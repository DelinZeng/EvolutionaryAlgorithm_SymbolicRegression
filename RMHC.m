%Random Mutation Hill Climber --- symbolic regression 
% num_eval = 1000;
% tree_depth = 7;
% population_size = 20;

function [error_history,best_fit_eqn] = RMHC(num_eval,tree_depth,population_size)

    % load the actual data from text file
    D = importdata('data.txt');
    data_x = D(:,1);
    data_y = D(:,2);
    figure(1)
    plot(data_x,data_y)
    hold on

    
    %generate an initial population
    for i = 1 : population_size
      
        %generate an individual dataset a_i in population 
        heap = generating_random_heap(tree_depth);
        str_expression = heap2expression(heap,tree_depth);
        %calculate the distance travel 
        fitness_error = calculate_fitness_error(str_expression,data_x,data_y);

        %store all the info into a struct s 
        field1 = 'heap';  value1(i) = {heap};
        field2 = 'expression';  value2(i) = {str_expression};
        field3 = 'fitness_error';  value3(i) = {fitness_error};

        initial_pop = struct(field1,value1,field2,value2,field3,value3);
    end 
    

    %evaluation
    parent_pop = initial_pop;
    error_fit = 1e8;
    for i = 1 : num_eval
        i
        
        [top_pop] = population_mutation_select(parent_pop,tree_depth,data_x,data_y);
        
        fitness_error = top_pop(1).fitness_error;
        
        %comparison
        if fitness_error < error_fit
           best_fit_eqn = top_pop(1).expression;
           error_fit = fitness_error;

    %        %plot 
    %        figure(1)
    %        fplot(best_fit,[0,20])
    %        ylim([-2,20])
    %        legend('Approximation','True')
    %        title(str_expression)
        end

        error_history(i)=error_fit;
       
        parent_pop = top_pop;

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
    
 
end 



