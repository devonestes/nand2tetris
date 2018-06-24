// push constant 7
@7 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 8
@8 // A=num
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
