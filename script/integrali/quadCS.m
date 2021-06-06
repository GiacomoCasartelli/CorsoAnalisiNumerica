function [Q] = quadCS(f,a,b)

%INPUT: 
% 1)funzione f
% 2)estremi dell'intervallo [a,b]
%OUTPUT: 
% 1)valore dell'integrale calcolato tramite C-S

%Usiamo come nodi a,(a+b)/2,b e calcoliamo i pesi:
%Approssimiamo l'integrale con la formula:

Q=((b-a)./6).*[f(a)+4.*f((a+b)./2)+f(b)];
