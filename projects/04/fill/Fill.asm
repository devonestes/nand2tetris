// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

// first = SCREEN
// last  = end of screen RAM address
// i     = screen address variable
// color = color to turn the screen

// initialize variables & pointers
@24576
D=A
@last
M=D

(START)
  // if k > 0
  //   goto BLACK
  // goto WHITE
  @SCREEN
  D=A
  @current
  M=D
  @KBD
  D=M
  @BLACK
  D;JNE
  @WHITE
  0;JMP

(BLACK)
  // color = !0
  // goto PAINT
  @0
  D=!A
  @color
  M=D
  @PAINT
  0;JMP

(WHITE)
  // color = 0
  // goto PAINT
  @0
  D=A
  @color
  M=D
  @PAINT
  0;JMP

(PAINT)
  // if current - last == 0
  //   goto START
  // goto NEXT
  @current
  D=M
  @last
  D=D-M
  @START
  D;JEQ
  @NEXT
  0;JMP

(NEXT)
  // current++
  // RAM[current] = color
  // goto PAINT
  @color
  D=M
  @current
  A=M
  M=D
  @current
  M=M+1
  @PAINT
  0;JMP
