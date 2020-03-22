function g = build_graph_linear(samples,neighbors)
g = zeros(size(samples,1),size(samples,1));
MAX_WEIGHT = 10000;
%Compute the similarity to make weights
for i = 1:size(samples,1)
    for j = 1:size(samples,1)
        %Compute the Manhattan distance between nodes.
        g(i,j) = 1/manhattan_distance(samples(i,1:end-1),samples(j,1:end-1));        
        %Deal with the NaN value
        if isinf(g(i,j))
            g(i,j) = MAX_WEIGHT;
        end
    end
end
%Clear the self similarity
for i = 1:size(samples,1)
    g(i,i) = 0;
end
%Reserve the number of n neighbors
g = reserve(g,neighbors);
return;