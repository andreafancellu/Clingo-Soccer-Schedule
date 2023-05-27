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

giornataAndata(1..19). 
giornataRitorno(20..38).

home(H,G):- match(H,A,G). % Definisco la partita in casa
away(A,G):- match(H,A,G). % Definisco la partita fuori casa

% ogni team, per ogni giornata di andata, ha tra 0 e 1 match in casa, non con se stessa e se non gioca fuori casa nella stessa giornata di andata
0 {match(H, A, G): team(A), H <> A, not away(H,G)} 1 :- team(H), giornataAndata(G). 

% ogni team, per ogni giornata di andata, ha tra 0 e 1 match in fuori casa, non con se stessa e se non gioca in casa nella stessa giornata di andata
0 {match(H, A, G): team(H), H <> A, not home(A,G)} 1 :- team(A), giornataAndata(G).

% ogni giornata di andata è composta da 10 match, tra squadre diverse
10 {match(H, A, G): team(H), team(A), H <> A} 10 :- giornataAndata(G).

% ogni team, per ogni giornata di ritorno, ha tra 0 e 1 match in casa, non con se stessa e se non gioca fuori casa nella stessa giornata di ritorno
0 {match(H, A, G): team(A), H <> A, not away(H,G)} 1 :- team(H), giornataRitorno(G).

% ogni team, per ogni giornata di ritorno, ha tra 0 e 1 match in fuori casa, non con se stessa e se non gioca in casa nella stessa giornata di ritorno
0 {match(H, A, G): team(H), H <> A, not home(A,G)} 1 :- team(A), giornataRitorno(G).

% ogni giornata di ritorno è composta da 10 match, tra squadre diverse
10 {match(H, A, G): team(H), team(A), H <> A} 10 :- giornataRitorno(G).

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

% calendario inter per semplificare i calcoli
match(lecce, inter, 1). 
match(inter, spezia, 2).  
match(lazio, inter, 3). 
match(inter, cremonese, 4).   
match(milan, inter, 5). 
match(inter, torino, 6).     
match(udinese, inter, 7).   
match(inter, roma, 8).     
match(sassuolo, inter, 9).    
match(inter, salernitana, 10).
match(fiorentina, inter, 11).   
match(inter, sampdoria, 12).  
match(juve, inter, 13).    
match(inter, bologna,14).
match(atalanta, inter, 15).   
match(inter, napoli, 16).   
match(monza, inter, 17).      
match(inter, verona, 18).      
match(inter, empoli, 19).    
match(cremonese, inter, 20).
match(inter, milan, 21).     
match(sampdoria, inter, 22).     
match(inter, udinese, 23).    
match(bologna, inter, 24).
match(inter, lecce, 25).
match(spezia, inter, 26).
match(inter, juve, 27).
match(inter, fiorentina, 28).
match(salernitana, inter, 29).
match(inter, monza, 30).
match(empoli, inter, 31).
match(inter, lazio, 32).
match(verona, inter, 33).
match(roma, inter, 34).
match(inter, sassuolo, 35).
match(napoli, inter, 36).
match(inter, atalanta, 37).
match(torino, inter, 38).


#show match/3.