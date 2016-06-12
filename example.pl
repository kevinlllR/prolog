% Paises
es_un_pais(peru). 
es_un_pais(paraguay).
es_un_pais(argentina).

% Limites

limita_con(peru,argentina).
limita_con(peru,brasil).
limita_con(argentina,uruguay).
limita_con(argentina,paraguay).
limita_con(paraguay,brasil).
limitrofes(X,Y):- (limita_con(X,Y) ; limita_con(Y,X)),(dif(X,Y);dif(Y,X)).
% limitrofes(X,Y):- limita_con(Y,X).

% Superficies
superficie_pais(brasil,242.22).
superficie_pais(uruguay,100.22).

% Condicional select * from r while Y<200
pais_pequeño(X):- superficie_pais(X,Y),Y<200.
% Problema
translimitrofes(X,Y):- limitrofes(X,Z),limitrofes(Z,Y),dif(X,Y),not(limitrofes(X,Y)).
% Mostrar select X, fron translimitrofes
mostrar_limitrofe(X):- translimitrofes(X,_).

% select * from x,y
producto(X,Y,Z):- es_un_pais(X),limita_con(Y,Z).
% select a,b from superficie_pais union limita_con
union(X,Y):- superficie_pais(X,Y);limita_con(X,Y).
% select a,b from uniom minun superficie_pais
diferencia(X,Y):- union(X,Y), \+superficie_pais(X,Y).
