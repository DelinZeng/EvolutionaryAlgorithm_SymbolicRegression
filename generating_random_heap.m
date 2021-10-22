
%%
% Heap Structure 
% grould rules: 
%   children of element i in position 2i and 2i+1
%   if the element is a terminal: constant number or T or variable X, then it won't have any offsprings
%   if the element is cos or sin, it only has one child
%   the root parent must be an operator 
%   the leaves of the tree must all be constant

function [heap]=generating_random_heap(depth)

    operators = [
        "plus";
        "minus";
        "multiply";
        "divide";
        "sin";
        "cos";
        
        "plus";
        "minus";
        "multiply";
        "divide";
        
        "plus";
        "minus";
        "multiply";
        "divide";
        
        "plus";
        "minus";
        "multiply";
        "divide";
        ];

    terminals = [
        "X";
        "T";
        ];

    tree_depth = depth;  
    depth_range_last = 2^(tree_depth-1):1:2^(tree_depth)-1;
    depth_range_secondlast = 2^(tree_depth-1-1):1:2^(tree_depth-1)-1;


    heap = string([]);
    rand_order = randperm(6);
    a = rand_order(1);
    heap(1) = operators(a);
    openlist = [heap(1)];
    i = 0;
    % for i = 1 : heap_size
    while length(openlist) > 0

        %pop the first element of the open list 
        Pop_openlist = openlist(1);
        i = i + 1; % the index of first element in the open list being popped

        %the eleaves of the tree must all be constant
        if i == depth_range_secondlast(end)
            [child1,child2] = producing_children(Pop_openlist,operators,terminals,0,1,i);
            heap(2*i) = child1;
            heap(2*i+1) = child2; 
            break 
        elseif any(i == depth_range_secondlast)
            [child1,child2] = producing_children(Pop_openlist,operators,terminals,0,1,i);
        else
            [child1,child2] = producing_children(Pop_openlist,operators,terminals,1,0,i);
        end

        heap(2*i) = child1;
        heap(2*i+1) = child2; 

        % add children to the open list for expansion
        openlist = [openlist,heap(2*i),heap(2*i+1)];

        %Remove the parents
        openlist = openlist(2:end);    
    end 

end 
 
