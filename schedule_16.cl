team(atalanta;bologna;cremonese;empoli;fiorentina;verona;inter;juve;lazio;lecce).
team(milan;monza;napoli;roma;salernitana;sampdoria).

%ogni squadra fa riferimento ad una città, che offre la struttura in cui la squadra gioca gli incontri in casa;
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


giornata(1..30).

% ogni match è formato da due team diversi fra loro
match(H, A) :- team(H), team(A), H <> A. 

% ogni match è assegnato ad una giornata
1 {assegna(G, match(H, A)) : giornata(G)} 1 :- match(H, A).

%ogni giornata ha 10 partite
8 {assegna(G, match(H, A)) : match(H, A)} 8 :- giornata(G).

% ogni squadra affronta due volte tutte le altre squadre;
15 {match(H, A) : team(A)} 15 :- team(H).

% una squadra non può giocare due volte in casa nella stessa giornata;
:- assegna(G, match(H, A1)), assegna(G, match(H, A2)), A1<>A2.

% una squadra non può giocare due volte fuori casa nella stessa giornata;
:- assegna(G, match(H1, A)), assegna(G, match(H2, A)), H1<>H2.

% una squadra non può giocare una volta in casa e una volta fuori casa nella stessa giornata;
:- assegna(G, match(H, A1)), assegna(G , match(A2, H)).

% Due delle 20 squadre fanno riferimento alla medesima città, quindi non possono giocare entrambe in casa nella stessa giornata
:- assegna(G, match(H1, A1)), assegna(G, match(H2, A2)), in(H1, C), in(H2, C), H1<>H2.

% suddivisione match di andata e ritorno
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 > 15, G2 > 15.
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 < 16, G2 < 16.


%Secondo vincolo facoltativo - la distanza tra una coppia di gare di andata e ritorno è di almeno 10 giornate
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 < 16, G2 > 15, G2-G1 < 8.

% Questo vincolo è il caso opposto di quello sopra
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 > 15, G2 < 16, G1-G2 < 8.



#show assegna/2.