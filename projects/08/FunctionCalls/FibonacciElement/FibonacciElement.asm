// bootstrap
@256
D=A
@SP
M=D
@Sys.init
0;JMP
// function Main.fibonacci 0
(Main.fibonacci)

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
// push constant 2
@2
D=A
@SP
A=M
M=D
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
D=D-M
@SP
A=M
M=-1
@CONTINUE11
D;JGT
@SP
A=M
M=0
(CONTINUE11)
@SP
M=M+1
// if-goto IF_TRUE in Main
@SP
M=M-1
A=M
D=M
@Main__IF_TRUE
D;JNE
// goto IF_FALSE in Main
@Main__IF_FALSE
0;JMP
// label IF_TRUE in Main
(Main__IF_TRUE)
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
// return
@LCL
D=M
@R14
M=D
@5
D=D-A
@R15
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R14
A=M-D
D=M
@THAT
M=D
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D
@R15
A=M
0;JMP
// label IF_FALSE in Main
(Main__IF_FALSE)
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
// push constant 2
@2
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
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// call Main.fibonacci 1 number 0

// push return address using label declared below
@Main.fibonacci$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL pointer
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG pointer
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS pointer
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THAT pointer
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

// reposition ARG (SP - (5 + arity))
@5
D=A
@1
D=D+A
@SP
D=M-D
@ARG
M=D

// reposition LCL = SP
@SP
D=M
@LCL
M=D

// goto Main.fibonacci
@Main.fibonacci
0;JMP

// set return location with label including call number
(Main.fibonacci$ret.0)
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
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// call Main.fibonacci 1 number 1

// push return address using label declared below
@Main.fibonacci$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL pointer
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG pointer
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS pointer
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THAT pointer
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

// reposition ARG (SP - (5 + arity))
@5
D=A
@1
D=D+A
@SP
D=M-D
@ARG
M=D

// reposition LCL = SP
@SP
D=M
@LCL
M=D

// goto Main.fibonacci
@Main.fibonacci
0;JMP

// set return location with label including call number
(Main.fibonacci$ret.1)
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
// return
@LCL
D=M
@R14
M=D
@5
D=D-A
@R15
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R14
A=M-D
D=M
@THAT
M=D
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D
@R15
A=M
0;JMP

// function Sys.init 0
(Sys.init)

// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1 number 2

// push return address using label declared below
@Main.fibonacci$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL pointer
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG pointer
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS pointer
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THAT pointer
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

// reposition ARG (SP - (5 + arity))
@5
D=A
@1
D=D+A
@SP
D=M-D
@ARG
M=D

// reposition LCL = SP
@SP
D=M
@LCL
M=D

// goto Main.fibonacci
@Main.fibonacci
0;JMP

// set return location with label including call number
(Main.fibonacci$ret.2)
// label WHILE in Sys
(Sys__WHILE)
// goto WHILE in Sys
@Sys__WHILE
0;JMP

