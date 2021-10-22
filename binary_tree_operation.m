%Operator system 
% terminals = [X, T, Const]

function [output] = binary_tree_operation(parent,child1,child2)
    a = child1;
    b = child2;


    if strcmp(parent,"Nah") == 1
       output = str2sym(parent);
    elseif strcmp(parent,"X") == 1 | strcmp(parent,"-X") == 1 
       output = str2sym(parent); 
    elseif strcmp(parent,"T") == 1
       output = sym(0);  
    elseif any(regexp(parent,'[0-9]')) == 1
       output = str2sym(parent);
    else
        
        if a == "T" 
           a = 0;  
        else
           a = str2sym(a);
        end 

        if b == "T" 
           b = 0;  
        else
           b = str2sym(b);
        end

        %plus
        if strcmp(parent,"plus") == 1
           output = a + b;       
        end 
        %minus
        if strcmp(parent,"minus") == 1
           output = a - b; 
        end 
        %mutiple
        if strcmp(parent,"multiply") == 1 
           output = a * b; 
        end 
        %divide  
        if strcmp(parent,"divide") == 1 
           if a == 0 | b == 0
               output = 0;
           else 
               output = a / b; 
           end 
        end 
        %sin
        if strcmp(parent,"sin") == 1 
           if a == Inf | b == Inf
               output = -1;
           else 
               output = sin(a+b); 
           end     
        end 
        %cos
        if strcmp(parent,"cos") == 1 
           if a == Inf | b == Inf
               output = 1;
           else 
               output = cos(a+b); 
           end 
        end
        
    end 
    
    
end 