// push constant 3030
@3030 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@THIS // Load pointer in A register
M=D // Change pointer address to poped value
// push constant 3040
@3040 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@THAT // Load pointer in A register
M=D // Change pointer address to poped value
// push constant 32
@32 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop this 2
@THIS
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
// push constant 46
@46 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop that 6
@THAT
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
@THIS
D=M // Set pointer for THIS to D register
@SP
A=M
M=D // Add pointer to THIS to top of stack
@SP
M=M+1
@THAT
D=M // Set pointer for THAT to D register
@SP
A=M
M=D // Add pointer to THAT to top of stack
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
// push this 2
@THIS // A=this pointer, M=this base address
D=M
@2
A=D+A
D=M // D=contents of this address
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
// push that 6
@THAT
D=M
@6
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
