clear all

f=@(x) 12*x.^3+3*x.^2+2.*x+1;
int=@(x) 3*x.^4 +x.^3+x.^2+x;

a=-1;
b=1;
exact=int(b)-int(a)

rule = getQrule('Gauss');
q = quad1(f,a,b,rule)

err =abs(q-exact)