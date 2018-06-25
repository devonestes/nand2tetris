// function SimpleFunction.test 2
(SimpleFunction.test)
D=0
@SP
A=M
M=D
@SP
M=M+1
D=0
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
// push local 1
@LCL
D=M
@1
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
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
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
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// push argument 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// return

// Store pointer to LCL in R14 (call this EndFrame)
@LCL
D=M
@R14
M=D

// Store pointer to return address in R15 (call this RetAddress)
@5
D=D-A
@R15
M=D

// move return value for caller
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D

// reposition SP for caller (SP = ARG + 1)
@ARG
D=M+1
@SP
M=D

// THAT = *(EndFrame - 1)
@1
D=A
@R14
A=M-D
D=M
@THAT
M=D

// THIS = *(EndFrame - 2)
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D

// ARG = *(EndFrame - 3)
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D

// LCL = *(EndFrame - 4)
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D

// goto RetAddress
@R15
A=M
0;JMP
