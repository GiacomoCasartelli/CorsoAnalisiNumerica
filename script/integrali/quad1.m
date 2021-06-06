function [Q] = quad1(f,a,b,Qrule)

%INPUT: 
% 1)funzione f
% 2)estremi dell'intervallo [a,b]
% 3)variabile struct che descrive la formula da usare Qrule
% la struct Qrule deve essere composta da
% a)Qrule.p = vettore dei valori dei pesi usati
% b)Qrule.x = vettore dei valori dei nodi usati
%OUTPUT: 
% il valore Q dell'integrale calcolato con i parametri in Qrule

% riscaliamo i nodi dal [0,1] nell'intervallo [a,b] e applichiamo la
% formula

assert(length(Qrule.p)==length(Qrule.x));
Q=f(Qrule.x.*(b-a)+a)*Qrule.p'; 
Q=Q*(b-a);
