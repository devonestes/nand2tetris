// bootstrap
@256
D=A
@SP
M=D
@Sys.init
0;JMP
// function Sys.init 0
(Sys.init)

// push constant 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D
// push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// call Sys.main 0 number 0

// push return address using label declared below
@Sys.main$ret.0
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
@SP
D=M-D
@ARG
M=D

// reposition LCL = SP
@SP
D=M
@LCL
M=D

// goto Sys.main
@Sys.main
0;JMP

// set return location with label including call number
(Sys.main$ret.0)
// pop temp 1
@SP
M=M-1
A=M
D=M
@6
M=D
// label LOOP in Sys
(Sys__LOOP)
// goto LOOP in Sys
@Sys__LOOP
0;JMP
// function Sys.main 5
(Sys.main)
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
D=0
@SP
A=M
M=D
@SP
M=M+1

// push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D
// push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@LCL
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
// push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@LCL
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
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@LCL
D=M
@3
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
// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.add12 1 number 0

// push return address using label declared below
@Sys.add12$ret.0
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
@6
D=A
@SP
D=M-D
@ARG
M=D

// reposition LCL = SP
@SP
D=M
@LCL
M=D

// goto Sys.add12
@Sys.add12
0;JMP

// set return location with label including call number
(Sys.add12$ret.0)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
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
// push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@LCL
D=M
@4
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
// function Sys.add12 0
(Sys.add12)

// push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D
// push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
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
// push constant 12
@12
D=A
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

