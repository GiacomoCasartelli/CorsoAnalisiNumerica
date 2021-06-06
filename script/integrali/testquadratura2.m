clear all

p=@(x) exp(x)+heaviside(x);

h=linspace(10,10^-6,100);
% h=zeros(1,25);
% for n=1:25
% h(n)=10*(2^(-n));
% end

exact=2*sinh(h/2)+h;
q=quadCS(p,-h/2,h/2);
err =abs(q-exact)

exponent =(log(err)-log(abs(quadCS(p,-0.5,0.5)-(2*sinh(0.5))+1)))./log(h);
exponent(100)=5;
exponent

plot(log(h),log(err));
