% Squadre di serie A e città
team(atalanta;bologna;cremonese;empoli).%;fiorentina;verona;inter;juve;lazio;lecce).
%team(milan;monza;napoli;roma;salernitana;sampdoria;sassuolo;spezia;torino;udinese).

in(atalanta, bergamo_).
in(bologna, bologna_).
in(cremonese, cremona_).
in(empoli, empoli_).
%in(fiorentina, firenze_).
%in(verona, verona_).
%in(inter, merda_).
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

giornata(1..2).

1 {assegna(T1, T2, G): giornata(G), team(T2)} 1 :- team(T1). % ogni team T1 può esssere associato a solo una giornata (in posizione T1)
1 {assegna(T1, T2, G): giornata(G), team(T1)} 1 :- team(T2). % ogni team T2 può esssere associato a solo una giornata (in posizione T2)

2 {assegna(T1 ,T2, G): team(T1), team(T2), T1 <> T2} 2 :- giornata(G). % ogni giornata deve contenere al massimo 2 match, tra team diversi

:- assegna(T, _, G), assegna(_, T, G). % non possono esistere giornate in cui lo stesso team gioca 2 volte, in posizioni diverse (T1 e T2)

#show assegna/3.



