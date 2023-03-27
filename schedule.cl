% Squadre di serie A e città
team(atalanta;bologna;cremonese;esmpoli;fiorentina;verona;inter;juve;lazio;lecce).
team(milan;monza;napoli;roma;salernitana;sampdoria).%;sassuolo;spezia;torino;udinese).

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
% in(sassuolo, sassuolo_).
% in(spezia, laspezia_).
% in(torino, torino_).
% in(udinese, udine_).

giornataAndata(1..15).
giornataRitorno(16..30).

home(H,G):- match(H,A,G).
away(A,G):- match(H,A,G).

0 {match(H, A, G): team(A), H <> A, not away(H,G)} 1 :- team(H), giornataAndata(G).
0 {match(H, A, G): team(H), H <> A, not home(A,G)} 1 :- team(A), giornataAndata(G).

8 {match(H, A, G): team(H), team(A), H <> A} 8 :- giornataAndata(G).

0 {match(H, A, G): team(A), H <> A, not away(H,G)} 1 :- team(H), giornataRitorno(G).
0 {match(H, A, G): team(H), H <> A, not home(A,G)} 1 :- team(A), giornataRitorno(G).

8 {match(H, A, G): team(H), team(A), H <> A} 8 :- giornataRitorno(G).

:- match(H, A, G1), giornataAndata(G1), match(H,A,G2), giornataRitorno(G2).
:- match(H, A, G1), giornataAndata(G1), match(H, A, G2), giornataAndata(G2), G1 <> G2.
:- match(H, A, G1), giornataRitorno(G1), match(H,A,G2), giornataRitorno(G2), G1 <> G2.
:- match(H1, _, G), match(H2, _, G), H1 <> H2, in(H1, C), in(H2, C).
:- match(H, _, G), match(_, H, G).

#show match/3.



