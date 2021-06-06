clear all

opts = odeset('RelTol',1e-3,'AbsTol',1e-4);

A = 4;
B = 2;
C = 3;
D = 1;
d = 6;
%sol = ode15s(@(t,y)LotkaVolterra(t,y,A,B,C,D),[0,10],[1/2,1/2],opts);
sol = ode15s(@(t,y)Competition(t,y,d),[0,2],[.7,0.45,.3],opts);

subplot(2,1,1);
plot(sol.x,sol.y);
subplot(2,1,2);
plot(sol.y(3,:),sol.y(1,:),'k');