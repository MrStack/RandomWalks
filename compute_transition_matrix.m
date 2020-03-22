function f = compute_transition_matrix(graph)
transition_matrix = zeros(size(graph));

%Compute transition probability
for i = 1:size(graph,1)
    for j = 1:size(graph,1)
        transition_matrix(i,j) = graph(i,j)/sum(graph(i,:));
    end
end
%Clear NaN
for i = 1:size(graph,1)
    for j = 1:size(graph,1)
        if isnan(transition_matrix(i,j))
            transition_matrix(i,j) = 0;
        end
    end
end
f = transition_matrix;
return;