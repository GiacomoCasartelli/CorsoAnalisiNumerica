function [dH] = divDiffHermite(xnodi,ynodi,y1nodi);
%input: 
%nodi (xnodi), 
%valori di f(x) nei nodi (ynodi), 
%valori della derivata f'(x) nei nodi (y1nodi).
%output: coefficienti del polinomio osculatore in forma di Newton (dH).

nDati = length(xnodi);
assert(length(ynodi) == nDati);
assert(length(y1nodi) == nDati);

%in questo caso ci servono 2n+1 coefficienti.
diffDivise = zeros(2*nDati,2*nDati)*NaN;
%riscrivo il primo elemento come f(x0).
diffDivise(1,1)=ynodi(1);

%costruzione del nuovo vettore x dei nodi.
x=zeros(1,2*nDati);
for k=1:nDati
    x(2*k-1)= xnodi(k);
    x(2*k)=x(2*k-1);
end
%calcolo la seconda colonna in cui compaiono le derivate prime.
for r=1:(nDati-1)
    diffDivise(2*r-1,2) = y1nodi(r);
    diffDivise(2*r,2) = (ynodi(r)-ynodi(r+1))/(x(2*r)-x(2*r+1));
end
diffDivise(2*nDati-1,2) = y1nodi(nDati);

%calcolo la colonna c+1-ma dalla terza in poi
for c=2:(2*nDati-1)
    R=1:(2*nDati-c); %indici di riga su cui lavorare
    diffDivise(R,c+1) = (diffDivise(R+1,c)-diffDivise(R,c))./(x(R+c)-x(R))';
end

dH.d = diffDivise(1,:);
dH.x = x;
