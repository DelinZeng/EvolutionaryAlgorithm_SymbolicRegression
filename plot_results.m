%results plot
clear all; close all



RS1 = load('./results/RS1.mat','error_history');
RS1_eqn = load('./results/RS1.mat','Eqn_fit');
fitness_curve_1 = RS1.error_history ; 
 curve_x = 1 : 10000; 

RS2 = load('./results/RS2.mat','error_history');
RS2_eqn = load('./results/RS1.mat','Eqn_fit');
fitness_curve_2 = RS2.error_history ; 

RS3 = load('./results/RS3.mat','error_history');
RS3_eqn = load('./results/RS1.mat','Eqn_fit');
fitness_curve_3 = RS3.error_history ; 


figure(1)
plot(curve_x,fitness_curve_1)
hold on
plot(curve_x,fitness_curve_2)
plot(curve_x,fitness_curve_3)



