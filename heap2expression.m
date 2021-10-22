% function that take the heap structure as input and return a mathematical
% expression as output
% note: the output of this function is a string, need to be converted to symbolic expression for
% caluculation and plotting, use str2sym() for conversion
function [str_expression] = heap2expression(heap,tree_depth)
% work from leaves to root 
    heap_mod = heap;
    for i = 1 : tree_depth-1 
        
        layer_depth = tree_depth - i ;
        depth_range = 2^(layer_depth-1):1:2^(layer_depth)-1;

        for j = 1 : length(depth_range)

            element_index = depth_range(j);
            element_child_1 = heap_mod(2*element_index);
            element_child_2 = heap_mod(2*element_index+1);  

            element = binary_tree_operation(heap_mod(element_index),element_child_1,element_child_2);
            heap_mod(element_index) = element;          
                
        end 

    end 
    str_expression = heap_mod(1);
end 