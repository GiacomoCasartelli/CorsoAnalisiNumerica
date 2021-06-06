function [aN] = aggiungiNodo(dD,x0,y0);
%input: 
%struct proveniente da diffDivise (dD), 
%nuovo nodo (x0), 
%valore nel nuovo nodo (y0).
%output: struct contenente la sequenza dei nuovi nodi e delle diff. div.(aN)

n = length(dD.x);
assert(length(dD.d) == n);

%calcolo la n+1-ma diff divisa
dDM = y0;
for c=1:n
    dDM = (dD.d(c)-dDM)/(dD.x(c)-x0);
end

aN.x=[dD.x,x0];
aN.d=[dD.d,dDM];