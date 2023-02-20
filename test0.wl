(*fissiamo una scelta *)

choice=0; (* oppure choice=1 *)

(* generiamo un numero casuale a protezione della schelta *)
n=RandomInteger[2^200]; (* questa informazione nota solo ad alice*)
y=Hash[n+scelta];       (* costruiamo il committment - alice si impegna a non cambiare la sua scelta *)

(* se la funzione di hash funziona bene *)
(* e il committment scheme e' sicuro    *)
(* allora *)
(* bob dal committment non puo' ricavare nessuna informazione sulla scelta *)
(* alice non puo' cambiare la sua scelta *)
(*  ovvero non puo' trovare un n' per cui *)
(*  il committment corrispondente con la scelta modificata *)
(*  coincide con y *)

(* Possiamo sempre cercarlo a con la ricerca esaustiva ...*)
TimeConstrained[
    n1=0;
    While[!(Hash[n1+1]==y),n1++];n1
,100]

(* oppure con il ragionamento *)
n1=n-1;
Print["h(n'+c') = ",Hash[n1+1]," h(n,c)=",y," ok =",Hash[n1+1]==y];

