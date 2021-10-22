
%function that takes two parents, perform a single point cross-over and
%return a child

tree_depth = 4;
depth_range = [];
left_tree_index = [];
right_tree_index = [];
for i = 1 : tree_depth
    depth_range = 2^(i-1):1:2^(i)-1;
    left_tree_index = [left_tree_index,depth_range(1:length(depth_range)/2)];
    right_tree_index = [right_tree_index,depth_range(length(depth_range)/2+1:end)];
end 


function [child] = heap_single_crossover(parent1,parent2,left_tree_index,right_tree_index)
    
    child = [];
    for j = 1 : length(left_tree_index)
        child(left_tree_index(j)) = parent1(left_tree_index(j));
        child(right_tree_index(j)) = parent2(right_tree_index(j));
    end
    
end 