%/home/fazza/Desktop/clingo-4.5.4-linux-x86_64/clingo schedule.cl -t 8 > schedule.txt cosi ti restituisce l'output su file

% sono iscritte 20 squadre;
team(atalanta;bologna;cremonese;empoli;fiorentina;verona;inter;juve;lazio;milan).

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
in(milan, milano_).

% 38 giornate, 19 di andata e 19 di ritorno NON simmetriche
giornata(1..18).

% ogni match è formato da due team diversi fra loro
match(H, A) :- team(H), team(A), H <> A. 

% ogni match è assegnato ad una giornata
1 {assegna(G, match(H, A)) : giornata(G)} 1 :- match(H, A).

%ogni giornata ha 10 partite
5 {assegna(G, match(H, A)) : match(H, A)} 5 :- giornata(G).

% ogni squadra affronta due volte tutte le altre squadre;
9 {match(H, A) : team(A)} 9 :- team(H).

% una squadra non può giocare due volte in casa nella stessa giornata;
:- assegna(G, match(H, A1)), assegna(G, match(H, A2)), A1<>A2.

% una squadra non può giocare due volte fuori casa nella stessa giornata;
:- assegna(G, match(H1, A)), assegna(G, match(H2, A)), H1<>H2.

% una squadra non può giocare una volta in casa e una volta fuori casa nella stessa giornata;
:- assegna(G, match(H, A1)), assegna(G , match(A2, H)).

% Due delle 20 squadre fanno riferimento alla medesima città, quindi non possono giocare entrambe in casa nella stessa giornata
:- assegna(G, match(H1, A1)), assegna(G, match(H2, A2)), in(H1, C), in(H2, C), H1<>H2.

% suddivisione match di andata e ritorno
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 > 9, G2 > 9.
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 < 10, G2 < 10.


%Primo vincolo facoltativo - ciascuna squadra non deve giocare mai più di due partite consecutive in casa o fuori casa;
:- assegna(G1, match(H, A1)), assegna(G2, match(H, A2)), G1>G2, G1-G2 = 1.
:- assegna(G1, match(H1, A)), assegna(G2, match(H2, A)), G2>G1, G2-G1 = 1.



%Secondo vincolo facoltativo - la distanza tra una coppia di gare di andata e ritorno è di almeno 5 giornate
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 < 10, G2 > 9, G2-G1 < 5.

% Questo vincolo è il caso opposto di quello sopra, non so se è necessario, ma secondo me ha senso.
:- assegna(G1, match(H, A)), assegna(G2, match(A, H)), G1 > 9, G2 < 10, G1-G2 < 5.



#show assegna/2.