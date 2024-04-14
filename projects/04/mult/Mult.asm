    @i
    M=1     // i = 1
    @R2
    M=0     // R2 = 0
(LOOP)
    @i
    D=M     // D = i
    @R1
    D=D-M   // D = i - R1
    @END
    D;JGT   // if (i - R1) > 0, then goto END

    // R2 + R0
    @R0
    D=M     // D = R0
    @R2
    M=M+D   // R2 = R2 + R0
    @i
    M=M+1   // i = i + 1

    @LOOP
    0;JMP   // goto LOOP
(END)
    @END
    0;JMP
