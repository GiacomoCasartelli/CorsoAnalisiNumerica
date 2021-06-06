function [Q,n] = quadAutoCS(f,a,b,toll)

%INPUT: 
% 1)funzione f.
% 2,3)estremi dell'intervallo [a,b].
% 4)la tolleranza utilizzata come criterio d'arresto.
% 5)il numero massimo di iterazioni Max.
%OUTPUT: 
% 1)il valore Q dell'integrale calcolato con il meccanismo di Richardson 
%   applicato al metodo di Cavalieri-Simpson con raffinamento adattivo.
% 2)il numero di sottointervalli utilizzati n.

%valore della funzione nei vertici del segmento diviso per 6
V = (f(a)+f(b))/6;

%valore della funzione nel punto medio diviso per 3.
M = (f((a+b)/2))/3; 

%valore della funzione nei nodi interni moltiplicati per il peso 2/3.
N = 2*(f(a+(b-a)/4)+f(a+3*(b-a)/4))/3; 

I = (V+2*M)*(b-a);   %integrale CS sull'intero sottointervallo
J = (b-a)*(V+M+N)/2; %integrale CS a due sottointervalli.

E = abs(J-I)/31; %errore calcolato con metodo di Richardson
n = 0;
if E>toll
    %valore dell'integrale sul primo sottointervallo del raffinamento
    %adattivo.
    [Q1,n1] = quadAutoCS(f,a,(b+a)/2,toll/2);
    %valore dell'integrale sul secondo sottointervallo del raffinamento
    %adattivo.
    [Q2,n2] = quadAutoCS(f,(b+a)/2,b,toll/2);
    
    %valore dell'integrale su tutto l'intervallo.
    J  = Q1 + Q2;
    
    %numero di sottointervalli usati.
    n = n + n1 + n2;
else
    n = n + 1;
end

Q = J;



