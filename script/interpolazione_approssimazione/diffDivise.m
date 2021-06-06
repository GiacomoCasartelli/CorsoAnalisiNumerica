function [D] = diffDivise(x,y); 
%input: nodi (x) e dati (y)
%output: array con differenze divise

nDati = length(x);
assert(length(y) == nDati);
diffDivise = zeros(1,nDati)*NaN;
diffDivise(:,1) = y'; %provare a fare con solo vettore
for c=1:(nDati-1)
    %calcolo la colonna c+1-ma
    %for r=1:(nDati-c)
    %    diffDivise(r,c+1) = (diffDivise(r+1,c)-diffDivise(r,c))/(x(r+c)-x(r));
    %end
    R=1:(nDati-c); %indici di riga su cui lavorare
    diffDivise(R,c+1) = (diffDivise(R+1,c)-diffDivise(R,c))./(x(R+c)-x(R))';
end

D.d = diffDivise(1,:);
D.x = x;