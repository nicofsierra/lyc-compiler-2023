include macros2.asm
include number.asm

.MODEL LARGE
.STACK 200h
.386
.387
.DATA

	@A 	DD 0.0
	@B 	DD 0.0
	@C 	DD 0.0
	@D 	DD 0.0
	@Z 	DD 0.0
	@H 	DD 0.0
	@E 	DD 0.0
	@R2 	DD 0.0
	@G 	DB MAXTEXTSIZE dup (?),'$'
	@F 	DB MAXTEXTSIZE dup (?),'$'
	@W 	DB MAXTEXTSIZE dup (?),'$'
	@fib1 	DD 0.0
	@fib2 	DD 0.0
	@fib3 	DD 0.0
	@variable1 	DD 0.0
	_5 	DD 5.0
	_-10 	DD -10.0
	_2.3 	DD 2.3
	_1 	DD 1.0
	_-.4 	DD -0.4
	_"HOLA" 	DB "0",'$',44 dup(?)
	_4 	DD 4.0
	_9 	DD 9.0
	_3 	DD 3.0
	_1.1 	DD 1.1
	@aux1 	DD 0.0
	@aux2 	DD 0.0
	@null 	DD -1.0

.CODE
.startup
	mov AX,@DATA
	mov DS,AX

	FLD _5
	FST @A
	FLD _-10
	FST @B
	FLD @A
	FLD _2.3
	FMUL
	FST @exp1
	FLD @exp1
	FLD _1
	FADD
	FST @exp2
	FLD @exp2
	FST @E
	FLD _2.3
	FST @H
	FLD _-.4
	FST @R2
	FLD _"HOLA"
	FST @G
	FLD @A
	FLD @B
	FADD
	FST @exp3
	FLD _5
	FLD @exp3
	FMUL
	FST @exp4
	FLD @exp4
	FST @Z
	FLD @A
	FST @aux1
	FLD _4
	FST @aux2
	FLD @B
	FST @aux1
	FLD _9
	FST @aux2
	FLD _5
	FST @D
	FLD @A
	FST @aux1
	FLD _4
	FST @aux2
	FLD @B
	FST @aux1
	FLD _9
	FST @aux2
	FLD @A
	FST @aux1
	FLD _4
	FST @aux2
	FLD _5
	FST @D
	FLD @A
	FST @aux1
	FLD _3
	FST @aux2
	FLD _4
	FST @D
	FLD _3
	FST @C
	FLD @E
	FST @aux1
	FLD @B
	FST @aux2
	FLD @E
	FLD _1.1
	FSUB
	FST @exp5
	FLD @exp5
	FST @E
	FLD @A
	FST @aux1
	FLD @B
	FST @aux2
	FLD _1
	FST @A
	mov ah, 4ch
	int 21h

;FIN DEL PROGRAMA DE USUARIO
