clear all

p=@(x) exp(x);

k=1


q1=quadAutoUnifCS(p,-1,1,10^(-6),100);

exact=2*sinh(1);

err1=abs(q1-exact);
err2=abs(q2-exact);

q1-q2;
