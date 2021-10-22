%test the diversity of the initiation of heap 
clear all; close all

% for i = 1 : 100
% 
% [heap]=generating_random_heap(7);
% [str_expression] = heap2expression(heap,7)
% figure(1)
% fplot(str_expression)
% ylim([0,20])
% xlim([0,20])
% end 

for i = 1 : 1000
    i
    depth = 8;
    [heap]=generating_random_heap(depth);
    [str_expression] = heap2expression(heap,depth);
    [mutated_heap] = heap_mutation(heap,depth);
    [mutated_str_expression] = heap2expression(mutated_heap,depth);
%     figure(1)
%     fplot(str_expression)
%     hold on 
%     fplot(mutated_str_expression)
%     hold off
%     xlim([-100 100])
%     ylim([-100 100])
end

% 
% D = importdata('data.txt');
% data_x = D(:,1);
% data_y = D(:,2);
% tree_depth = 8;
% for i = 1 : 10
%     
%     %generate an individual dataset a_i in population 
%     heap = generating_random_heap(tree_depth);
%     str_expression = heap2expression(heap,tree_depth);
%     %calculate the distance travel 
%     fitness_error = calculate_fitness_error(str_expression,data_x,data_y);
% 
%     %store all the info into a struct 
%     field1 = 'heap';  value1(i) = {heap};
%     field2 = 'expression';  value2(i) = {str_expression};
%     field3 = 'fitness_error';  value3(i) = {fitness_error};
% 
%     initial_pop = struct(field1,value1,field2,value2,field3,value3);
%     
% end 


     

