// push constant 10
@10 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
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
// push constant 21
@21 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 22
@22 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop argument 2
@ARG
D=M
@2
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
// pop argument 1
@ARG
D=M
@1
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
// push constant 36
@36 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop this 6
@THIS
D=M
@6
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
// push constant 42
@42 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 45
@45 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop that 5
@THAT
D=M
@5
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
// pop that 2
@THAT
D=M
@2
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
// push constant 510
@510 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop temp 6
@SP
M=M-1
A=M
D=M
@11 // A=selected temp address, M=contents of selected temp address
M=D // M[selected temp address]=popped data from d register
// push local 0
@LCL // A=local pointer, M=local base address
D=M
@0
A=D+A
D=M // D=contents of local address
@SP
A=M
M=D
@SP
M=M+1
// push that 5
@THAT
D=M
@5
A=D+A
D=M // D=contents of that address
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
// push argument 1
@ARG // A=arg pointer, M=arg base address
D=M
@1
A=D+A
D=M // D=contents of arg address
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
// push this 6
@THIS // A=this pointer, M=this base address
D=M
@6
A=D+A
D=M // D=contents of this address
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@THIS // A=this pointer, M=this base address
D=M
@6
A=D+A
D=M // D=contents of this address
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
// push temp 6
@11 // A=temp num, M=contents of temp address
D=M // D=contents of temp address
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
