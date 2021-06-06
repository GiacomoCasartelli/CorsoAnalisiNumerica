function [Y,T] = RK4(f,y0,tFin,dt) 

%INPUT:
% 1)function handle f=@(t,y)
% 2)dato iniziale y0
% 3)tempo finale tFin
% 4)passo temporale dt
%OUTPUT: Vettore Y dei valori della funzione calcolata con metodo di 
% Runge-Kutta 4.

Y(1) = y0 + dt.*f(0,y0);
T(1) = dt;

max=tFin/dt;
for n=2:max 
    temp = T(n-1);
    K1   = f(temp,Y(n-1));
    K2   = f(temp+0.5.*dt,Y(n-1)+dt./2.*K1);
    K3   = f(temp+0.5.*dt,Y(n-1)+dt./2.*K2);
    K4   = f(temp+dt,Y(n-1)+dt.*K3);
    Y(n) = Y(n-1) + dt.*((K1+K4)./6+(K2+K3)./3);
    
    T(n) = temp + dt;
end