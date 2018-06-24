// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@LCL
D=M
@0
A=D+A
D=A
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
A=M
M=D
// label LOOP_START in BasicLoop
(LOOP_START)
// push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
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
// pop local 0
@LCL
D=M
@0
A=D+A
D=A
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
A=M
M=D
// push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
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
// pop argument 0
@ARG
D=M
@0
A=D+A
D=A
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
A=M
M=D
// push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto LOOP_START in BasicLoop
@SP
M=M-1
A=M
D=M
@LOOP_START
D;JNE
// push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
