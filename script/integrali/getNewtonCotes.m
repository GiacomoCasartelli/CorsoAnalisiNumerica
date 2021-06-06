function Q = getNewtonCotes(k)

% INPUT: numero di nodi considerati
% OUTPUT: struct contenente i dati per la quadratura newton cotes 
%  compatibili con quad1:
%  Q.p = array dei pesi
%  Q.x = array dei nodi

% Calcolo i nodi equidistanti
Q.x(1) = 0;
for i=1:k
    Q.x(i+1) = (i)*1/(k);
end

%Calcolo i pesi con la matrice di Vandermonde
for i=1:k+1
    z(i)=1/i;
end
Q.p=(inv(fliplr(vander(Q.x))')*z')';