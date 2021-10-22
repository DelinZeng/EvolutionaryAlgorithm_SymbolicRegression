%function that takes the parent as input and produce the children according
%to the type of parent

function [child1,child2] = producing_children(parent,operators,terminals,No_T,No_operators_T,element_index)

    %Terminal elements don't have childrens
    if strcmp(parent,"T") | strcmp(parent,"X") | strcmp(parent,"Nah") | any(regexp(parent,'[0-9]'))
       child1 = "Nah";
       child2 = "Nah";  
    %parent that is cos or sin only have one child
    elseif strcmp(parent,"sin") | strcmp(parent,"cos")
       child1 = "T";
       child2 = generating_random_elements(operators,terminals,No_T,No_operators_T,element_index);
    else 
       child1 = generating_random_elements(operators,terminals,No_T,No_operators_T,element_index);
       child2 = generating_random_elements(operators,terminals,No_T,No_operators_T,element_index);
    end
end 