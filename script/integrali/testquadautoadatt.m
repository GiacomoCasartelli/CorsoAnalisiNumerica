clear all

p=@(x) exp(2*x);


[Q,n] = quadAutoCS(p,-1,1,10^-6)
exact = sinh(2);
err = abs(Q -exact)