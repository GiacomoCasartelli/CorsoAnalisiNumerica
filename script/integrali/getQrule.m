function [G] = getQrule(str)

% INPUT:
% stringa str che contiene la parola che indica il metodo da usare
% OUTPUT:
% lo struct G con i parametri necessari a implementare il metodo scelto
% i campi sono :
% 1)G.p campo contenente un array di pesi ordinati
% 2)G.x campo contenente un array di nodi ordinati
% Per garantire il funzionamento del codice garantiamo in output il metodo
% del punto medio nel caso in cui non venga specificata nessuna stringa, o
% si commettano errori di battitura.

if (strcmp(str,{'PtoMed','Trap','CavSim','Gauss'}) == logical([0,0,0,0]))
    fprintf('ATTENZIONE, non è stata inserita una stringa corretta, verrà mandato in output il metodo del punto medio. \n')
    fprintf('Per avere un altro metodo usare una stringa tra: Trap, CavSim, Gauss.')
end

G.p = 1;
G.x = 1/2;

if strcmp(str,'Trap')
    G.p = [1/2,1/2];
    G.x = [0,1];
end

if strcmp(str,'CavSim')
    G.p = [1/6,2/3,1/6];
    G.x = [0,1/2,1];
end

if strcmp(str,'Gauss')
    G.p = [1/2,1/2];
    G.x = [1/2-sqrt(3)/6,1/2+sqrt(3)/6]; 
end


