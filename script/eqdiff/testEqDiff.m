%equazione logistica: p'=r*p*(1-p/K); p(0)=p0;
clear all

K=10;
r=0.5;
p0=1;
tFin=30;
toll=10^-3;

f = @(t,p) r*p*(1-p/K);
p = @(t) (K.*p0)./(p0+(K-p0).*exp(-r.*t));

[T1,Y1,nRif1]=EEEM(f,p0,tFin,toll);
[T2,Y2,nRif2]=EMRK3(f,p0,tFin,toll);
nRif1
nRif2
numPassi1=length(T1)
numPassi2=length(T2)


T=T2;
Y=Y2;

exact = p(T);
err   = abs(Y-exact);

subplot(2,2,1);
plot(T,Y);

subplot(2,2,2);
semilogy(diff(T));

subplot(2,2,3);
semilogy(T,err);

subplot(2,2,4);
semilogy(T(2:end),diff(T));



