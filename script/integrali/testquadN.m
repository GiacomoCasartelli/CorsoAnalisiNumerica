clear all

p=@(x) exp(x);

exact=2*sinh(1);

rule=getQrule('Gauss');
q=zeros(1,10);
for k=1:10
  N=2^(k-1);
  q(k)=quadN(p,-1,1,N,rule);
end
q
M=2.^(0:9);

err =abs(q-exact)
r = -(log(err)-log(err(1)))./log(M)

plot(log(err));