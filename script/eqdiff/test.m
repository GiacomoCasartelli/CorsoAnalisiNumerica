clear all

opts = odeset('RelTol',1e-3,'AbsTol',1e-3);

sig = 1;
r = 100;
b = 1;
odefun = @(t,y) [-sig*y(1) + sig*y(2); -y(1)*y(3)+r*y(1)-y(2);y(1)*y(2)-b*y(3) ];
    
sol = ode15s(odefun,[0,30],[2,0,0],opts);
  
plot3(sol.y(1,:),sol.y(2,:),sol.y(3,:));