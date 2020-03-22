function f = clear_redundant_edges(structure_sim_matrix,graph)
%Check size
if size(structure_sim_matrix) ~= size(graph)
    error('Size of graph is not equal.');
end
%Using the graph structure to erase redundant edges
for i = 1:size(structure_sim_matrix,1)
    for j = 1:size(structure_sim_matrix,1)
        if graph(i,j) == 0
            structure_sim_matrix(i,j) = 0;
        end
    end
end
f = structure_sim_matrix;
return;