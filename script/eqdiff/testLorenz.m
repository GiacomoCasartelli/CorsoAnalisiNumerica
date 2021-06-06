clear all

opts = odeset('RelTol',1e-8,'AbsTol',1e-10);

sig = 10;  %10
r = 196;    %30
b = 8/3;   %8/3
    
sol = ode15s(@(t,y)Lorenz(t,y,sig,r,b),[-10,10],[6,2,-1],opts);
                                      %[-10,10],[-8,8,r-1]

subplot(2,2,1);
plot(sol.y(1,:),sol.y(2,:),'k');
subplot(2,2,2);
plot(sol.y(1,:),sol.y(3,:),'k');
subplot(2,2,3);
plot3(sol.y(1,:),sol.y(2,:),sol.y(3,:),'k');
subplot(2,2,4);
plot(sol.x,sol.y);
