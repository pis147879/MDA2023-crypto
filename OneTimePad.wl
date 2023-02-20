Enc[k_, m_] := Mod[m + k, 2];
f[x_] := IntegerDigits[x, 2, 8];
String2Bin[mesg_] := Flatten[Map[f, ToCharacterCode[mesg]]];


messaggio = "ciao ci vediamo alle 17";
m=String2Bin[messaggio];
len = Length[m];
Seed[2];
keystream = Table[RandomInteger[1], len];
ciphertext = Enc[m, keystream];
c=Map[FromDigits[#,2]&,Partition[ciphertext,8]];
cifrato=FromCharacterCode[c]


Print["codice cifrato",cifrato];

(* per decifrare si usa lo stesso keystream che va
sottratto dal cifrato, ma nel campo binario, addizione e sottrazione 
coincidono, e dunque si puo' usare la stessa funzione di cifratura *)
p2=Enc[String2Bin[cifrato],keystream]
p=Map[FromDigits[#,2]&,Partition[p2,8]];
ptxt=FromCharacterCode[p];
Print[ptxt]
