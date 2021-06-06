clear all

p=@(x) (1+(2.*x).^2).^(-1);

for k=1:20
    q2=quadAutoUnif(p,-1,1,10^(-6),100,getNewtonCotes(k))
end

exact=(atan(2)-atan(-2))/2
err2=abs(q2-exact);
