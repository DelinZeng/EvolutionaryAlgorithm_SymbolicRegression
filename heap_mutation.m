% function that takes heap as an input and output an variation through
% mutation

%mutation: small && random
%small change to coefficient
%mutiply brach by a factor close to 1 Y
%add a samll constant Y
%replace branch with average constant Y

function [heap_mutated] = heap_mutation(heap,tree_depth)

    heap_length = length(heap);
    heap_mutated = heap;
    
    i = randi(round(heap_length));
    while strcmp(heap(i),"Nah") == 1
        i = randi(round(heap_length));
    end 

    a = randi(2);
    
    if a == 1 %swap an element with an constant
        heap_mutated(i) = randi([-10 10]);
    elseif a == 2 %homogeneous mutation
        
        %if chosen element is terminals, assign a random constant
        if strcmp(heap_mutated(i),"T") == 1 
            heap_mutated(i) = randi([-10 10]);
        elseif strcmp(heap_mutated(i),"X") == 1 
            heap_mutated(i) = randi([-10 10])*sym("X");
        elseif any(regexp(heap_mutated(i),'[0-9]')) == 1
            heap_mutated(i) = heap_mutated(i) + randi([-10 10]);  
        %if chosen element is operators, randomly assign a different operators    
        elseif strcmp(heap_mutated(i),"plus") == 1 
            heap_mutated(i) = randsample(["minus";"multiply";"divide"],1);
        elseif strcmp(heap_mutated(i),"minus") == 1 
            heap_mutated(i) = randsample(["plus";"multiply";"divide"],1);
        elseif strcmp(heap_mutated(i),"mutiply") == 1 
            heap_mutated(i) = randsample(["plus";"minus";"divide"],1);
        elseif strcmp(heap_mutated(i),"divide") == 1 
            heap_mutated(i) = randsample(["plus";"minus";"multiply"],1);
        elseif strcmp(heap_mutated(i),"sin") == 1 
            heap_mutated(i) = randsample(["plus";"minus";"multiply";"divide";"cos"],1);
        elseif strcmp(heap_mutated(i),"cos") == 1 
            heap_mutated(i) = randsample(["plus";"minus";"multiply";"divide";"sin"],1);
        end 
        
    end 
        
        
end 
    
    
    
        





