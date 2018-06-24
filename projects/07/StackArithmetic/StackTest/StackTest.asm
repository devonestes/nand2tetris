// push constant 17
@17 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 17
@17 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If the two values are equal, D will equal 0.
@SP // A=0, M=266
A=M
M=-1
@CONTINUE8 // Load sequence number of continue
D;JEQ // Jump there if the two values were equal
@SP
A=M
M=0
(CONTINUE8)
@SP
M=M+1
// push constant 17
@17 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 16
@16 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If the two values are equal, D will equal 0.
@SP // A=0, M=266
A=M
M=-1
@CONTINUE11 // Load sequence number of continue
D;JEQ // Jump there if the two values were equal
@SP
A=M
M=0
(CONTINUE11)
@SP
M=M+1
// push constant 16
@16 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 17
@17 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If the two values are equal, D will equal 0.
@SP // A=0, M=266
A=M
M=-1
@CONTINUE14 // Load sequence number of continue
D;JEQ // Jump there if the two values were equal
@SP
A=M
M=0
(CONTINUE14)
@SP
M=M+1
// push constant 892
@892 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 891
@891 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If D was less than M, D will be negative
@SP
A=M
M=-1
@CONTINUE17 // Load sequence number of continue
D;JGT // Jump the false branch if D was less than M
@SP
A=M
M=0
(CONTINUE17)
@SP
M=M+1
// push constant 891
@891 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 892
@892 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If D was less than M, D will be negative
@SP
A=M
M=-1
@CONTINUE20 // Load sequence number of continue
D;JGT // Jump the false branch if D was less than M
@SP
A=M
M=0
(CONTINUE20)
@SP
M=M+1
// push constant 891
@891 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 891
@891 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If D was less than M, D will be negative
@SP
A=M
M=-1
@CONTINUE23 // Load sequence number of continue
D;JGT // Jump the false branch if D was less than M
@SP
A=M
M=0
(CONTINUE23)
@SP
M=M+1
// push constant 32767
@32767 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 32766
@32766 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If D was greater than M, D will be positive
@SP
A=M
M=-1
@CONTINUE26 // Load sequence number of continue
D;JLT // Jump the false branch if D was greater than
@SP
A=M
M=0
(CONTINUE26)
@SP
M=M+1
// push constant 32766
@32766 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 32767
@32767 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If D was greater than M, D will be positive
@SP
A=M
M=-1
@CONTINUE29 // Load sequence number of continue
D;JLT // Jump the false branch if D was greater than
@SP
A=M
M=0
(CONTINUE29)
@SP
M=M+1
// push constant 32766
@32766 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 32766
@32766 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M // If D was greater than M, D will be positive
@SP
A=M
M=-1
@CONTINUE32 // Load sequence number of continue
D;JLT // Jump the false branch if D was greater than
@SP
A=M
M=0
(CONTINUE32)
@SP
M=M+1
// push constant 57
@57 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 31
@31 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 53
@53 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M // D=M[257]
@SP
M=M-1
A=M
M=M+D // M[256]=M[256] + M[257]
@SP
M=M+1
// push constant 112
@112 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M // D=M[257]
@SP
M=M-1
A=M
M=M-D // M[256]=M[256] - M[257]
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push constant 82
@82 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
