function [samples,g,transition_matrix,structure_sim_matrix,clusters] = random_walks_clustering(samples,neighbors,walk_steps)
%MATLAB code of Random walks clustring
%Version 1.0
%
%@author Haokun Jiang
%
%@param samples the input of samples
%@param neighbors assign the dgree of each 
%node while building the graph, but it will 
%probably be changed when symmetrized
%@param walk_steps determine the walking 
%steps of random walks
%@return sampes same with the input
%@return g graph of the inputs
%@return transition_matrix transition matrix of 
%the graph
%@return structure_sim_matrix the matrix which
%the NS(G) seperator was applied
%@return clusters results of the clustering

%1.Build the graph
g = build_graph_linear(samples,neighbors);
g = make_symmetric(g);
%Find the the iteration times automatically
separator_iteration_times = 1;
for i = 1:intmax('uint32')
    %2.Compute the transition matrix
    transition_matrix = compute_transition_matrix(g);
    
    %3.Using transition matrix to random walks
    %current_walk for debug only
    [current_walk,total_walk] = random_walks(transition_matrix,walk_steps);
    
    %4.Compute similarity
    structure_sim_matrix = similarity_matrix(total_walk,walk_steps);
    structure_sim_matrix = clear_redundant_edges(structure_sim_matrix,g);
    
    %If the last and present distance is less than 1e-4 break;
    %Iteration complete
    if euclidean_distance(g,structure_sim_matrix) < 1e-4
        disp('Iteration complete.');
        break;
    end
    
    separator_iteration_times = separator_iteration_times + 1;    
    g = structure_sim_matrix;
        
    %Display iteration times
    disp(strcat(['Iteration: ' num2str(separator_iteration_times)]));
    
end
%Print iteration times
fprintf('\n');
disp(strcat(['Total ' num2str(separator_iteration_times) ' iterations']));

%Build a graph object to use MATLAB graph function
G = graph(structure_sim_matrix);

%5.Use separator to cut weak connections
G = cut_weak_connections(G);

%6.Using breadth first search to cluster the nodes
clusters = graph_clustering(G);

%Plot G
figure;plot(G,'Layout','Force');
title('Graph');
xlabel(strcat(num2str(max(clusters(:))),' Clusters'));
%Plot cluster to see clusters directly
figure;plot(1:size(clusters,2),clusters,'ob','MarkerSize',5);
title('Clusters distribution');
xlabel('Samples');
ylabel('Cluster counts');
legend(strcat(num2str(max(clusters(:))),' Clusters'));
axis([0 size(clusters,2) 0 max(clusters(:))+1]);
return;