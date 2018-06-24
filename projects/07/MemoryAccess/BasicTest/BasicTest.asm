// push constant 10
@10 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// pop local 0
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255 (top of stack)
D=M // D=popped value
@R13 // A=13, M=contents of R13
M=D // A=13, M=popped value
@0 // A=local offset, M=?
D=A // D=local offset
@LCL // A=local pointer, M=local base address
D=D+M // D=local base address + local offset (address where the popped value in R13 is going)
@R14 // A=14, M=contents of R14
M=D // M=selected local address
@R13 // A=13, M=contents of R13 (popped value)
D=M // D=popped value
@R14 // A=14, M=selected local address
A=M // A=selected local address
M=D // M=popped value
// push constant 21
@21 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// push constant 22
@22 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// pop argument 2
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255 (top of stack)
D=M // D=popped value
@R13 // A=13, M=contents of R13
M=D // A=13, M=popped value
@2 // A=local offset, M=?
D=A // D=local offset
@ARG // A=arg pointer, M=arg base address
D=D+M // D=arg base address + arg offset (address where the popped value in R13 is going)
@R14 // A=14, M=contents of R14
M=D // M=selected arg address
@R13 // A=13, M=contents of R13 (popped value)
D=M // D=popped value
@R14 // A=14, M=selected arg address
A=M // A=selected arg address
M=D // M=popped value
// pop argument 1
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255 (top of stack)
D=M // D=popped value
@R13 // A=13, M=contents of R13
M=D // A=13, M=popped value
@1 // A=local offset, M=?
D=A // D=local offset
@ARG // A=arg pointer, M=arg base address
D=D+M // D=arg base address + arg offset (address where the popped value in R13 is going)
@R14 // A=14, M=contents of R14
M=D // M=selected arg address
@R13 // A=13, M=contents of R13 (popped value)
D=M // D=popped value
@R14 // A=14, M=selected arg address
A=M // A=selected arg address
M=D // M=popped value
// push constant 36
@36 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// pop this 6
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255 (top of stack)
D=M // D=popped value
@R13 // A=13, M=contents of R13
M=D // A=13, M=popped value
@6 // A=local offset, M=?
D=A // D=local offset
@THIS // A=this pointer, M=this base address
D=D+M // D=this base address + this offset (address where the popped value in R13 is going)
@R14 // A=14, M=contents of R14
M=D // M=selected this address
@R13 // A=13, M=contents of R13 (popped value)
D=M // D=popped value
@R14 // A=14, M=selected this address
A=M // A=selected this address
M=D // M=popped value
// push constant 42
@42 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// push constant 45
@45 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// pop that 5
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255 (top of stack)
D=M // D=popped value
@R13 // A=13, M=contents of R13
M=D // A=13, M=popped value
@5 // A=local offset, M=?
D=A // D=local offset
@THAT // A=that pointer, M=that base address
D=D+M // D=that base address + that offset (address where the popped value in R13 is going)
@R14 // A=14, M=contents of R14
M=D // M=selected that address
@R13 // A=13, M=contents of R13 (popped value)
D=M // D=popped value
@R14 // A=14, M=selected that address
A=M // A=selected that address
M=D // M=popped value
// pop that 2
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255 (top of stack)
D=M // D=popped value
@R13 // A=13, M=contents of R13
M=D // A=13, M=popped value
@2 // A=local offset, M=?
D=A // D=local offset
@THAT // A=that pointer, M=that base address
D=D+M // D=that base address + that offset (address where the popped value in R13 is going)
@R14 // A=14, M=contents of R14
M=D // M=selected that address
@R13 // A=13, M=contents of R13 (popped value)
D=M // D=popped value
@R14 // A=14, M=selected that address
A=M // A=selected that address
M=D // M=popped value
// push constant 510
@510 // A=num
D=A // D=num
@SP // A=0, M=256
A=M // A=256, M=*256
M=D // *256=num
@SP // A=0, M=256
M=M+1 // M=257
// pop temp 6
@SP // A=0, M=256
M=M-1 // A=0, M=255
A=M // A=255, M=contents of 255
D=M // D=contents of 255
@11 // A=selected temp address, M=contents of selected temp address
M=D // M=contents of 255
// push local 0
@LCL // A=local pointer, M=local base address
D=M // D=local base address
@0 // A=local offset, M=?
A=D+A // A=local base address + local offset, M=contents of local 2 or whatever
D=M // D=contents of local address
@SP // A=0, M=256
A=M // A=256, M=contents of 256
M=D // M=contents of local address
@SP // A=0, M=256
M=M+1 // A=0, M=257
// push that 5
@THAT
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP // A=0, M=258
M=M-1 // M=257
A=M // A=257, M=contents of 257 (top element in stack)
D=M // D=contents of 257 (top element in stack)
@SP // A=0, M=257
M=M-1 // A=H, M=256
A=M // A=256, M=contents of 256 (second element in stack)
M=M+D // 256=contents of 256 + contents of 257 (sum of top values)
@SP // A=0, M=256
M=M+1 // M=257
// push argument 1
@ARG // A=arg pointer, M=arg base address
D=M // D=arg base address
@1 // A=arg offset, M=?
A=D+A // A=arg base address + arg offset, M=contents of arg 2 or whatever
D=M // D=contents of arg address
@SP // A=0, M=256
A=M // A=256, M=contents of 256
M=D // 256=contents of arg address
@SP // A=0, M=256
M=M+1 // A=0, M=257
// sub
@SP // A=0, M=258
M=M-1 // A=0, M=257
A=M // A=257, M=contents of 257 (top element in stack)
D=M // D=contents of 257 (top element in stack)
@SP // A=0, M=257
M=M-1 // M[0]=256
A=M // A=256, M=contents of 256 (second element in stack)
M=M-D // M[256]=contents of 256 - contents of 257 (difference of top values)
@SP // A=0, M[0]=256
M=M+1 // A=0, M[0]=257
// push this 6
@THIS // A=this pointer, M=this base address
D=M // D=this base address
@6 // A=this offset, M=?
A=D+A // A=this base + offset, M=contents of selected address
D=M // D=contents of selected this address
@SP // A=0, M=256
A=M // A=256, M=contents of 256
M=D // 256=contents of selected this address
@SP // A=0, M=256
M=M+1 // M=257
// push this 6
@THIS // A=this pointer, M=this base address
D=M // D=this base address
@6 // A=this offset, M=?
A=D+A // A=this base + offset, M=contents of selected address
D=M // D=contents of selected this address
@SP // A=0, M=256
A=M // A=256, M=contents of 256
M=D // 256=contents of selected this address
@SP // A=0, M=256
M=M+1 // M=257
// add
@SP // A=0, M=258
M=M-1 // M=257
A=M // A=257, M=contents of 257 (top element in stack)
D=M // D=contents of 257 (top element in stack)
@SP // A=0, M=257
M=M-1 // A=H, M=256
A=M // A=256, M=contents of 256 (second element in stack)
M=M+D // 256=contents of 256 + contents of 257 (sum of top values)
@SP // A=0, M=256
M=M+1 // M=257
// sub
@SP // A=0, M=258
M=M-1 // A=0, M=257
A=M // A=257, M=contents of 257 (top element in stack)
D=M // D=contents of 257 (top element in stack)
@SP // A=0, M=257
M=M-1 // M[0]=256
A=M // A=256, M=contents of 256 (second element in stack)
M=M-D // M[256]=contents of 256 - contents of 257 (difference of top values)
@SP // A=0, M[0]=256
M=M+1 // A=0, M[0]=257
// push temp 6
@11 // A=temp num, M=contents of temp address
D=M // D=contents of temp address
@SP // A=0, M=256
A=M // A=256, M=contents of 256
M=D // 256=contents of temp address
@SP // A=0, M=256
M=M+1 // A=0, M=257
// add
@SP // A=0, M=258
M=M-1 // M=257
A=M // A=257, M=contents of 257 (top element in stack)
D=M // D=contents of 257 (top element in stack)
@SP // A=0, M=257
M=M-1 // A=H, M=256
A=M // A=256, M=contents of 256 (second element in stack)
M=M+D // 256=contents of 256 + contents of 257 (sum of top values)
@SP // A=0, M=256
M=M+1 // M=257
