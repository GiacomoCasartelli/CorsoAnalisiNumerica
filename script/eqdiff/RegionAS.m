function [] = RegionAS(A,b,extx,exty)

%INPUT:
% 1)A matrice quadrata nxn;
% 2)b vettore 1xn;
% 3)extx vettore 1x2 degli estremi in x (xmin,xmax);
% 4)exty vettore 1x2 degli estremi in y (ymin,ymax);
%OUTPUT: nessuno.
%
%La funzione crea un Plot della regione di alta stabilità .

%check dimensioni
n=length(b);
s=size(A);
assert(s(1)==s(2));
assert(s(1)==n);

%generazione coordinate 
precision=80; %numero di passi da eseguire (inserire un intero!)
X =linspace(extx(1),extx(2),precision); %ricordare linspace crea 100 sottointervalli
Y =linspace(exty(1),exty(2),precision);

f=@(z) abs(1 + z*(b/(eye(n)-z.*A)*(ones(1,n)')));

for h=1:precision
    for k=1:precision
        Z(k,h)=f(X(h)+1i*Y(k)); %costruzione della matrice dei valori di f
    end
end

contourf(X,Y,Z,[1,1]);

