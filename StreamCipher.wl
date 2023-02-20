UpdateLFSR[taps_][stato_]:=Prepend[Drop[stato,-1],Mod[Plus@@(stato[[Length[stato]-taps]]),2]]
OutputLFSR[stato_]:=stato[[-1]]
Keyloading[key_,iv_]:=Join[IntegerDigits[key,2,4],IntegerDigits[iv,2,2]]
Keystream[key_,iv_,len_]:=Map[OutputLFSR, Drop[NestList[UpdateLFSR[taps],Keyloading[key,iv],len],1]]
Enc[k_, m_] := Mod[m + k, 2];
Dec[k_, m_] := Enc[k,m];

String2Bin[mesg_] := Flatten[Map[IntegerDigits[#, 2, 8]&, ToCharacterCode[mesg]]];
Bin2String[p2_]:=Module[{p},
    (
        p=Map[FromDigits[#,2]&,Partition[p2,8]];
        FromCharacterCode[p]
    )]

(* esempio *)

(* Alice e Bob si mettono d'accordo sulla chiave *)

key=23;
iv=12;

(* Alice Cifra *)

m=String2Bin["ci vediamo alle 17"];
ciphertext = Enc[m,Keystream[key,iv,Length[m]]];
Print[ctx=Bin2String[ciphertext]];

(* Bob decifra *)

m=String2Bin[ctx]
p2=Dec[m,Keystream[key,iv,Length[m]]];
ptx=Bin2String[p2];
Print[ptx]