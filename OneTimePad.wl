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


Print[cifrato]
p2=Enc[String2Bin[cifrato],keystream]
p=Map[FromDigits[#,2]&,Partition[p2,8]];
ptxt=FromCharacterCode[p];
Print[ptxt]
