

%function that generates a random element from random constants or six operators 
%or two terminals

%Note: each types of elements has a equal probability to be chosen in this
%version

%For future version, types of elements to be chosen should depend on the
%parent index. For example, elements near the root should more likely be
%operators so we can keep the tree growing 


function [element] = generating_random_elements(operators,terminals,No_T,No_operators_T,element_index)   
     
   
%      % add the penality to the probability of being a constant if the
%      % element index is small
%      if element_index < 20
%          element_index_factor = element_index/20;
%          a = random('uniform', 0, 10, [1]) / element_index_factor;
%      else 
%          a = random('uniform', 0, 10, [1]);
%      end 
     a = random('uniform', 0, 10, [1]);

     rand_order_op = randi(length(operators)); %generate a random index to choose operators
     rand_order_t = randi(length(terminals)); %generate a random index to choose terminals
     
     if No_T == 1
         % if 1 -- operators
         if a > 3
            element = operators(rand_order_op);
         end 
         %if 2 -- terminals
         if a > 1.5 && a <= 3   
            element = terminals(rand_order_t);
         end 
         %if 3 -- constant
         if a <= 1.5 
%             element = random('uniform', -10, 10, [1]);
            element = randi([-10 10]);
         end         
     elseif No_operators_T == 1 
         %if 2 -- terminals
         if a > 5 
            element = terminals(rand_order_t);
         end 
         %if 3 -- constant
         if a <=5 
%             element = random('uniform', -10, 10, [1]);
            element = randi([-10 10]);
         end 
     else  
         % if 1 -- operators
         if a > 3
            element = operators(rand_order_op);
         end 
         %if 2 -- terminals
         if a > 1.5 && a <= 3 
            element = terminals(rand_order_t);
         end 
         %if 3 -- constant
         if a <= 1.5 
%              element = random('uniform', -10, 10, [1]);
            element = randi([-10 10]);
         end       
     end  
     
end 