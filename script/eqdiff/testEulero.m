%equazione logistica: p'=r*p*(1-p/K); p(0)=p0;
clear all

K=10;
r=0.5;
p0=1;
tFin=30;

f = @(t,p) r*p*(1-p/K);
p = @(t) (K.*p0)./(p0+(K-p0).*exp(-r.*t));

for m=1:8
    dt(m) = 10/(10^((m+1)/2));
    [Y1,T1] = euleroEsplicito(f,p0,tFin,dt(m));
    [Y2,T2] = RK4(f,p0,tFin,dt(m));
    [Y3,T3] = RK3(f,p0,tFin,dt(m));
    [Y4,T4] = RK4(f,p0,tFin,dt(m));
    exact = p(T1);
    
    err1 = abs(Y1-exact)
    M1(m) = max(err1);
    
    err2 = abs(Y2-exact);
    M2(m) = max(err2);
    
    err3 = abs(Y3-exact);
    M3(m) = max(err3);
    
    err4 = abs(Y4-exact);
    M4(m) = max(err4);
end


loglog(dt,M1,'-');
hold on
loglog(dt,M2,'*');
loglog(dt,M3,'x');
loglog(dt,M4,'o');



