% Squadre di serie A e città
team(atalanta;bologna;cremonese;empoli).%;fiorentina;verona;inter;juve;lazio;lecce).
%team(milan;monza;napoli;roma;salernitana;sampdoria;sassuolo;spezia;torino;udinese).

in(atalanta, bergamo_).
in(bologna, bologna_).
in(cremonese, cremona_).
in(empoli, empoli_).
%in(fiorentina, firenze_).
%in(verona, verona_).
%in(inter, milano_).
%in(juve, torino_).
%in(lazio, roma_).
%in(lecce, lecce_).
%in(milan, milano_).
%in(monza, monza_).
%in(napoli, napoli_).
%in(roma, roma_).
%in(salernitana, salerno_).
%in(sampdoria, genova_).
%in(sassuolo, sassuolo_).
%in(spezia, laspezia_).
%in(torino, torino_).
%in(udinese, udine_).

% 4 giornate
giornata(1..4).

% 2 match per giornata
match(T1, T2) :- team(T1), team(T2), T1 <> T2.
2 {assegna(match(T1, T2), G): team(T1), team(T2), T1 <> T2} 2 :- giornata(G).

% conta, per ogni giornata, quante volte compare un cert team in prima posizione
quantiT1(G, ContaT1) :- giornata(G), ContaT1 = #count{T1:assegna(match(T1, T2), G)}.
:- quantiT1(G, ContaT1), ContaT1 < 2.


% conta, per ogni giornata, quante volte compare un cert team in seconda posizione e scarta quelle in cui ne compaiono meno di 1
quantiT2(G, ContaT2) :- giornata(G), ContaT2 = #count{T2:assegna(match(T1, T2), G)}.
:- quantiT2(G, ContaT2), ContaT2 < 2.


#show assegna/2.



