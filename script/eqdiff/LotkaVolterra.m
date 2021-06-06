function dydt = LotkaVolterra(t,y,A,B,C,D)
%INFO:
%INPUT:
% 1)t, y variabili di tempo e vettore delle y.
% 2)A,B = parametri A e B del modello Predatore-Preda
%OUTPUT:
% restituisce la soluzione dell'equazione di Lotka-Volterra

dydt= [(A-B*y(2))*y(1); (C*y(1)-D)*y(2)];
end
