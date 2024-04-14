// checking key-board input
(KBD_INPUT)
    @SCREEN  // Address of SCN
    D=A     // D = 16384
    @i
    M=D     // i = 16384

    @24576  // Address of KBD
    D=M     // D = RAM[24576]

    @FILL
    D;JGT   // if RAM[24576] > 0, then goto FILL
    @UN_FILL
    0;JMP   // goto UN_FILL

// fill screen
(FILL)
    @i
    D=M     // D = i (screen address)
    @24576
    D=D-A   // D = i - 24576
    @KBD_INPUT
    D;JGE   // if (i - 24576) >= 0, then goto KBD_INPUT

    @i
    A=M     // indirect addressing
    M=-1    // put black pixels in RAM[i]
    @i
    M=M+1   // i = i + 1

    @FILL
    0;JMP   // goto FILL

// un-fill screen
(UN_FILL)
    @i
    D=M     // D = i
    @24576
    D=D-A   // D = i - 24576
    @KBD_INPUT
    D;JGE   // if (i - 24576) >= 0, then goto KBD_INPUT

    @i
    A=M     // indirect addressing
    M=0     // put white pixels in RAM[i]
    @i
    M=M+1   // i = i + 1

    @UN_FILL
    0;JMP   // goto UN_FILL
