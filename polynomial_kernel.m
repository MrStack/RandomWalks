function f = polynomial_kernel(x,y,r,d)
f = (sum(x.*y)/sqrt(sum(x.*x))*sqrt(sum(y.*y))+r)^d;
return;