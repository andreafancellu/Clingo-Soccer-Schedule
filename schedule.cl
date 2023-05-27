% Squadre di serie A e città
team(atalanta;bologna;cremonese;empoli;fiorentina;verona;inter;juve;lazio;lecce).
team(milan;monza;napoli;roma;salernitana;sampdoria;sassuolo;spezia;torino;udinese).

in(atalanta, bergamo_).
in(bologna, bologna_).
in(cremonese, cremona_).
in(empoli, empoli_).
in(fiorentina, firenze_).
in(verona, verona_).
in(inter, milano_).
in(juve, rivoli_).
in(lazio, frosinone_).
in(lecce, lecce_).
in(milan, milano_).
in(monza, monza_).
in(napoli, napoli_).
in(roma, roma_).
in(salernitana, salerno_).
in(sampdoria, genova_).
in(sassuolo, sassuolo_).
in(spezia, laspezia_).
in(torino, torino_).
in(udinese, udine_).

giornata(1..38).

match(H, A) :- team(H), team(A), H <> A. 

1 {assegna(G, match(H, A)) : giornata(G)} 1 :- match(H, A).
19 {match(H, A) : team(A)} 19 :- team(H).
10 {assegna(G, match(H, A)) : match(H, A)} 10 :- giornata(G).
:- assegna(G, match(H, A1)), assegna(G, match(H, A2)), A1<>A2.
:- assegna(G, match(H1, A)), assegna(G, match(H2, A)), H1<>H2.
:- assegna(G, match(H, A1)), assegna(G , match(A2, H)).
:- assegna(G, match(H1, A1)), assegna(G, match(H2, A2)), in(H1, C), in(H2, C), H1<>H2.


%! idea per vincolo opzionale 1
% :- match(H, _, G1), match(H, _, G2), giornataAndata(G1), giornataAndata(G2), home(H, G1), home(H, G2), team(H), G2 - G1 = 1.
% :- match(_, A, G1), match(_, A, G2), giornataAndata(G1), giornataAndata(G2), away(A, G1), away(A, G2), team(A), G2 - G1 = 1.

% :- match(H, _, G1), match(H, _, G2), giornataRitorno(G1), giornataRitorno(G2), home(H, G1), home(H, G2), team(H), G2 - G1 = 1.
% :- match(_, A, G1), match(_, A, G2), giornataRitorno(G1), giornataRitorno(G2), away(A, G1), away(A, G2), team(A), G2 - G1 = 1.



#show assegna/2.