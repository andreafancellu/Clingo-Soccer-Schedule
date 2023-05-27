% Squadre di serie A e città
team(atalanta;bologna;cremonese;empoli).%;fiorentina;verona;inter;juve;lazio;lecce).
%team(milan;monza;napoli;roma;salernitana;sampdoria;sassuolo;spezia;torino;udinese).

in(atalanta, bergamo_).
in(bologna, bergamo_).
in(cremonese, cremona_).
in(empoli, empoli_).

giornataAndata(1..3). 
giornataRitorno(4..6).

home(H,G):- match(H,A,G). % Definisco la partita in casa
away(A,G):- match(H,A,G). % Definisco la partita fuori casa

% ogni team, per ogni giornata di andata, ha tra 0 e 1 match in casa, non con se stessa e se non gioca fuori casa nella stessa giornata di andata
0 {match(H, A, G): team(A), H <> A, not away(H,G)} 1 :- team(H), giornataAndata(G). 

% ogni team, per ogni giornata di andata, ha tra 0 e 1 match in fuori casa, non con se stessa e se non gioca in casa nella stessa giornata di andata
0 {match(H, A, G): team(H), H <> A, not home(A,G)} 1 :- team(A), giornataAndata(G).

% ogni giornata di andata è composta da 10 match, tra squadre diverse
2 {match(H, A, G): team(H), team(A), H <> A} 2 :- giornataAndata(G).

% ogni team, per ogni giornata di ritorno, ha tra 0 e 1 match in casa, non con se stessa e se non gioca fuori casa nella stessa giornata di ritorno
0 {match(H, A, G): team(A), H <> A, not away(H,G)} 1 :- team(H), giornataRitorno(G).

% ogni team, per ogni giornata di ritorno, ha tra 0 e 1 match in fuori casa, non con se stessa e se non gioca in casa nella stessa giornata di ritorno
0 {match(H, A, G): team(H), H <> A, not home(A,G)} 1 :- team(A), giornataRitorno(G).

% ogni giornata di ritorno è composta da 10 match, tra squadre diverse
2 {match(H, A, G): team(H), team(A), H <> A} 2 :- giornataRitorno(G).

% non vogliamo lo stesso identico match in una giornata di andata e in una di ritorno
:- match(H, A, G1), giornataAndata(G1), match(H, A, G2), giornataRitorno(G2).

% non vogliamo lo stesso identico match in due giornate di andata
:- match(H, A, G1), giornataAndata(G1), match(H, A, G2), giornataAndata(G2), G1 <> G2.

% non vogliamo lo stesso identico match in due giornate di ritorno
:- match(H, A, G1), giornataRitorno(G1), match(H,A,G2), giornataRitorno(G2), G1 <> G2.

% non vogliamo due match nella stessa giornata dove le due squadre in casa, giocano nella stessa città
:- match(H1, _, G), match(H2, _, G), H1 <> H2, in(H1, C), in(H2, C).

% ?Secondo me questo vincolo non serve più, i vincoli a riga 33, 36, 42, 45  fanno lo stesso lavoro, dovremmo testarlo in qualche modo
%! e invece ... mannaggia a CLINGO 
% non vogliamo che nella stessa giornata una squadra possa giocare sia in casa che fuori casa
:- match(H, _, G), match(_, H, G).

%! idea per vincolo opzionale 1
% :- match(H, _, G1), match(H, _, G2), giornataAndata(G1), giornataAndata(G2), home(H, G1), home(H, G2), G2 - G1 = 1.
% :- match(_, A, G1), match(_, A, G2), giornataAndata(G1), giornataAndata(G2), G2 - G1 = 1.

% :- match(H, _, G1), match(H, _, G2), giornataRitorno(G1), giornataRitorno(G2), G2 - G1 = 1.
% :- match(_, A, G1), match(_, A, G2), giornataRitorno(G1), giornataRitorno(G2), G2 - G1 = 1.



#show match/3.