function dydt = Lorenz(t,y,sig,r,b)
%INFO:
%INPUT:
% 1)t, y variabili di tempo e vettore delle y.
% 2)sig,r,b = parametri sigma,r e b del Modello di Lorenz
%OUTPUT:
% restituisce la soluzione del modello di Lorenz

dydt= [-sig*y(1) + sig*y(2); -y(1)*y(3)+r*y(1)-y(2);y(1)*y(2)-b*y(3) ];

end
