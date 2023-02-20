
Get["StreamCipher.wl"];

UpdateLFSR3[taps_][stato_]:={
    UpdateLFSR[taps[[1]]][stato[[1]]],
    UpdateLFSR[taps[[2]]][stato[[2]]],
    UpdateLFSR[taps[[3]]][stato[[3]]]
    };

F[x_,y_,z_]:=Mod[x y +z,2];
OutputLFSR3[stato_]:=F@@Map[OutputLFSR,stato];

Keyloading3[key_,iv_]:={
    Join[IntegerDigits[key,2,3],IntegerDigits[iv,2,3]],
    Join[IntegerDigits[key,2,2],IntegerDigits[iv,2,1]],
    Join[IntegerDigits[key,2,3],IntegerDigits[iv,2,4]]
}