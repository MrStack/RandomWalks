function result_graph = reserve(graph,neighbors)
maxes = zeros(1,neighbors);
indexes = zeros(1,neighbors);

for i = 1:size(graph,1)
    %Find n top max values and store them
    for j = 1:neighbors
        maxes(j) = max(graph(i,:));
        indexes(j) = index_of(graph(i,:),maxes(j));
        graph(i,indexes(j)) = 0;
    end
    %Clear a row;
    graph(i,:) = zeros(1,size(graph,2));
    %Restore the maxes
    for j = 1:neighbors
        graph(i,indexes(j)) = maxes(j);
    end
end
result_graph = graph;
return;