% function that takes a population, mutate, combine, and sort
% return the top population

function [top_pop]=population_mutation_select(parent_pop,tree_depth,data_x,data_y)

    for i = 1 : length(parent_pop)
        
        heap = parent_pop(i).heap;
        heap_mutated = heap_mutation(heap,tree_depth);
        str_expression = heap2expression(heap_mutated,tree_depth);
        %calculate the new fitness error 
        fitness_error = calculate_fitness_error(str_expression,data_x,data_y);
        
        %store all the info into a struct 
        field1 = 'heap';  value1(i) = {heap_mutated};
        field2 = 'expression';  value2(i) = {str_expression};
        field3 = 'fitness_error';  value3(i) = {fitness_error};

        child_pop = struct(field1,value1,field2,value2,field3,value3);
    
    end 
    
    %combine the parent population and child population
    f1 = 'heap'; v1 = {parent_pop.heap , child_pop.heap};
    f2 = 'expression'; v2 = {parent_pop.expression , child_pop.expression};
    f3 = 'fitness_error'; v3 = {parent_pop.fitness_error , child_pop.fitness_error};
    C = struct(f1,v1,f2,v2,f3,v3);

    %sort the combined pupulation
    T = struct2table(C); % convert the struct array to a table
    sortedT = sortrows(T, 'fitness_error'); % sort the table by 'd'
    sortedC = table2struct(sortedT); % change it back to struct array 

    %selection
    top_pop = sortedC(1:length(sortedC)/2);
    

end 