function [yy] = newtonEval(D,xx);
%input:
%nodi (x), 
%differenze divise(D), 
%punti in cui valutare il polinomio(xx).
%output: valori del polinomio nei punti xx (yy)

%definiamo le variabili lunghezza e verifichiamone la coerenza
m=length(xx);
n=length(D.x);
assert(length(D.d)==n);

%utilizziamo l'algoritmo di Neville
yy=zeros(1,m)+D.d(n);
for k=(n-1):-1:1
      yy=yy.*(xx-D.x(k))+D.d(k);
end 