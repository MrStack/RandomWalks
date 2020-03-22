function f = gaussian_kernel(x,y,sigma)
f = exp(-(sum(x-y)^2/2*sigma^2));
return;