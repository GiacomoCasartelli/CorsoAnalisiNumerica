clear all

opts = odeset('RelTol',1e-5,'AbsTol',1e-5);

odefun = @(t,y) [y(2); 1000*(1-y(1)^2)*y(2)-y(1)];
    
sol1 = ode15s(odefun,[0,3000],[2,0],opts);
%sol2 = ode45(odefun,[0,300],[2,0],opts);
  
plot(sol1.x,sol1.y(1,:))

