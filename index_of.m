function index = index_of(vector,elem)
%Search the index of appointed value
index = -1;
vector = reshape(vector,1,[]);
for i = 1:size(vector,2)
    if vector(i) == elem
        index = i;
        return;
    else
        continue;
    end
end
return;