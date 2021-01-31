% esempio di regole ricorsive tramite la costruzione di un grafo

arco(a,b).%                a
arco(a,c).%               / \       f
arco(b,d).%              b   c      |
arco(c,d).%               \ /       g
arco(d,e).%                d
arco(f,g).%                |
          %                e

% introduzione delle regole ricorsive
connessi(X,X). % un vertice e' connesso/raggiungibile da se stesso
connessi(X,Y) :- arco(X,Z), connessi(Z,Y).
% due vertici sono connessi se:
% - esiste un arco che parte dal primo vertice e va in un alto qualsiasi
% - il vertice di arrivo (quello "qualsiasi" insomma) e' connesso al secondo vertice
% NB: se non vi fosse la prima parte questa definizione di connessi non potrebbe funzionare


