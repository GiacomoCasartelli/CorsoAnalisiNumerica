function dydt = Competition(t,y,d)
%INFO:
%INPUT:
% 1)t, y variabili di tempo e vettore delle y.
% 2)r1,r2,k1,k2 = parametri del modello Predatore-Preda
% 3)a1,a2 parametri di cooperazione (se >0) o competizione (se <0)
%OUTPUT:
% restituisce la soluzione dell'equazione di competizione

dydt= [y(1)*(-3*y(1)-y(2)+2*y(3)+2);y(2)*(y(1)/2-3*y(2)/2+1+d*(y(2)-1))
     ;y(3)*(0.5*y(1)+2*y(2)-4.5*y(3)+3)]; 
end