function f = similarity_matrix(PvisitKi,k)
similarity_vect = zeros(size(PvisitKi));
for i = 1:size(PvisitKi,2)
    for j = 1:size(PvisitKi,1)
        similarity_vect(i,j) = compute_similarity(PvisitKi(i,:),PvisitKi(j,:),'simk',k);
    end
end
%Clear self similarity
for i = 1:size(similarity_vect,1)
    similarity_vect(i,i) = 0;
end
f = similarity_vect;
return;