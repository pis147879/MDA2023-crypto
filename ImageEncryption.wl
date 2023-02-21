(* carico un'immagine dal web*)
shannon=Import["https://media.newyorker.com/photos/5909765cc14b3c606c1089f4/master/w_2240,c_limit/Roberts-Claude-Shannon.jpg"];
(* recupero la sequenza di bit *)
plaintext=ImageData[shannon,"Bit"];
dimensions=Dimensions[plaintext]
ptx2=Flatten[plaintext];

(* FASE DI ENCRYPTION *)

    (* fisso una chiave *)
        key=45
    (* inizializzo il generatore *)
        SeedRandom[key]
    (* genero il keystream con il generatore di WM *)
        keystream=Table[RandomInteger[1],Length[ptx2]];

    (* cifro *)
        ctx=Mod[ptx2+keystream,2];

(* riconverto -- per motivi di presentazione -- la sequenza cifrata in immagine*)
ciphertext=Partition[Partition[ctx,dimensions[[-1]]],dimensions[[-2]]];
Dimensions[ciphertext]
img=Image[ciphertext];
Print["scrambled image  \n",Show[img,ImageSize->Large]];

(* Decryption *)

plaintext=ImageData[img,"Bit"];
dimensions=Dimensions[plaintext]
ptx2=Flatten[plaintext];
key=45;
SeedRandom[key];
keystream=Table[RandomInteger[1],Length[ptx2]];
ctx=Mod[ptx2+keystream,2];
ciphertext=Partition[Partition[ctx,dimensions[[-1]]],dimensions[[-2]]];
Dimensions[ciphertext];
decrypted=Image[ciphertext];

Print["decrypted image  \n",Show[decrypted,ImageSize->Large]];