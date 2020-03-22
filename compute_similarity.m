function f = compute_similarity(vec_x,vec_y,method,walk_steps)
%walk_steps will be ignored if using cosine method but the parameter of walk_steps should be
%nedded when this function was called
if strcmp(method,'cos')
    inner_product_xy = sum(vec_x.*vec_y);
    inner_product_xx = sum(vec_x.*vec_x);
    inner_product_yy = sum(vec_y.*vec_y);
    cosine = inner_product_xy/(sqrt(inner_product_xx)*sqrt(inner_product_yy));
    f = cosine;
elseif strcmp(method,'simk')
    sim = exp(2*walk_steps - sum(abs(vec_x-vec_y))) - 1;
    f = sim;
end
return;