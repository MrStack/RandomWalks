function clusters = graph_clustering(G)
visited = false(1,size(G.Nodes,1));
%Cluster array
clusters = int32(zeros(1,size(G.Nodes,1)));
cluster_count = 1;
for i = 1:size(G.Nodes,1)
    if visited(i) == true
        continue;
    else
        breadth_search = bfsearch(G,i);
        for j = 1:size(breadth_search,1)
            visited(breadth_search(j)) = true;
            clusters(breadth_search(j)) = cluster_count;
        end
        cluster_count = cluster_count + 1;
    end
end
return;