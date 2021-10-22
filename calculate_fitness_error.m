
%functio that calculate the fitness error 

function [fitness_error] = calculate_fitness_error(str_expression,data_x,data_y)
  
    %convert the approximation equation into symbolic form 
    eqn1 = str2sym(str_expression);
        
    %calculate the approximation error 
    fitness_error = 0;
    for k = 1 : 50 : length(data_x)
        X = data_x(k);
        fitness_error = abs(subs(eqn1)-data_y(k)) + fitness_error;
    end 
%     fitness_error = double(fitness_error);
    
end 