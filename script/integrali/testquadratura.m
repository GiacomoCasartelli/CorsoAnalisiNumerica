clear all

p=@(x) exp(x);

l=10;
h=zeros(1,l);
for n=1:l
h(n)=10*(2^(-n));
q(n)=quad1(p,-h(n)/2,h(n)/2,getNewtonCotes(3));
end

exact=2*sinh(h/2);

err =abs(q-exact);
exponent =(log(err)-log(abs(quadCS(p,-0.5,0.5)-2*sinh(0.5))))./log(h);

exponent

plot(log(h),log(err));