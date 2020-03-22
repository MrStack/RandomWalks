function f = euclidean_distance(vec_x,vec_y)
distance = sqrt(sum(reshape((vec_x-vec_y).^2,1,[])));
f = distance;
return;