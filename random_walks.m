function [current,total_probability] = random_walks(transition_matrix,steps)
total_probability = transition_matrix;
copy = transition_matrix;

for i = 1:steps-1
    transition_matrix = transition_matrix*copy;
    total_probability = total_probability+transition_matrix;
end
current = transition_matrix;
return;