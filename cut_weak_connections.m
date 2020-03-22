function f = cut_weak_connections(G)
%Sort the weights of whole graph
edge_weights = sort(G.Edges.Weight);
%Apply first difference to get the max drop
weights_diff = diff(edge_weights);
weights_to_cut = edge_weights(index_of(weights_diff,max(weights_diff(:))));
i = 1;
while i  <= size(G.Edges.Weight,1)
    %If the edge weight is less than cut threshold, remove it
    if G.Edges.Weight(i) <= weights_to_cut
        G = rmedge(G,i);
        continue;
    end
    i = i + 1;
end
f = G;
return;