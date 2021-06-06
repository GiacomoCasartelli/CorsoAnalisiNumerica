%equazione logistica: p'=r*p*(1-p/K); p(0)=p0;

K=10;
r=0.5;
p0=1;
tFin=10;

f = @(t,p) t^4+4*t^2;
%p = @(t) (K.*p0)./(p0+(K-p0).*exp(-r.*t));

dt=0.1;
[Y,T] = euleroEsplicito(f,p0,tFin,dt);

plot(T,Y)

%exact = p(T);
%err = abs(Y-exact);

%loglog(T,err);