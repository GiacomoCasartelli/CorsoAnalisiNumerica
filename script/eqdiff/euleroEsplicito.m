function [Y,T] = euleroEsplicito(f,y0,tFin,dt)

%INPUT:
% 1)function handle f=@(t,y)
% 2)dato iniziale y0
% 3)tempo finale tFin
% 4)passo temporale dt
%OUTPUT: Vettore Y dei valori della funzione calcolata con metodo di 
% Eulero Esplicito.

Y(1) = y0 + dt.*f(0,y0);
T(1) = dt;

max=tFin/dt;
for n=2:max 
    T(n) = T(n-1) + dt;  %T(n) = n*dt;
    Y(n) = Y(n-1) + dt.*f(T(n-1),Y(n-1));
end