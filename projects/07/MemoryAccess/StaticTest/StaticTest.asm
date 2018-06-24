// push constant 111
@111 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 333
@333 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// push constant 888
@888 // A=num
D=A // D=num
@SP
A=M
M=D // M[256]=num
@SP
M=M+1
// pop static 8 from StaticTest
@SP
M=M-1
A=M
D=M
@StaticTest.8
M=D
// pop static 3 from StaticTest
@SP
M=M-1
A=M
D=M
@StaticTest.3
M=D
// pop static 1 from StaticTest
@SP
M=M-1
A=M
D=M
@StaticTest.1
M=D
// push static 3 from StaticTest
@StaticTest.3
D=M // Load value from that static address to D register
@SP
A=M
M=D
@SP
M=M+1
// push static 1 from StaticTest
@StaticTest.1
D=M // Load value from that static address to D register
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
// push static 8 from StaticTest
@StaticTest.8
D=M // Load value from that static address to D register
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
