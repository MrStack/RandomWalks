function f = make_symmetric(matrix)
%Check input matrix
if size(matrix,1) ~= size(matrix,2)
    error('Not a square matrix');
end

for i = 1:size(matrix,1)
    for j = 1:size(matrix,1)
        if matrix(i,j) ~= 0 && matrix(j,i) == 0
            matrix(j,i) = matrix(i,j);
        elseif matrix(i,j) == 0 && matrix(j,i) ~= 0
            matrix(i,j) = matrix(j,i);
        elseif matrix(i,j) ~= 0 && matrix(j,i) ~= 0
            matrix(i,j) = (matrix(i,j) + matrix(j,i)) / 2;
            matrix(j,i) = matrix(i,j);
        end
    end
end
f = matrix;
return;