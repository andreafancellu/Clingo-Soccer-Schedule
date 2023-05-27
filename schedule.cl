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

%Primo vincolo facoltativo
%:- assegna(G1, match(H, _)), assegna(G2, match(H, _)), G1 > G2, G1-G2 = 1.
%:- assegna(G1, match(H, _)), assegna(G2, match(H, _)), G1 < G2, G2-G1 = 1.

%Secondo vincolo facoltativo
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 < 20, G2 >19, G2-G1 < 10.
#show assegna/2.