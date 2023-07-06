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
	@E 	DD 0.0
	@Z 	DD 0.0
	@H 	DD 0.0
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
	_1 	DD 1.0
	_5 	DD 5.0
	_4 	DD 4.0
	_9 	DD 9.0
	_5 	DD 5.0
	_4 	DD 4.0
	_9 	DD 9.0
	_4 	DD 4.0
	_5 	DD 5.0
	_3 	DD 3.0
	_4 	DD 4.0
	_3 	DD 3.0
	_"HOLA" 	DB "0",'$',44 dup(?)
	_"HOLA TODO BIEN!" 	DB "0",'$',33 dup(?)
	_12 	DD 12.0
	_1 	DD 1.0
	_1 	DD 1.0
	@@filter 	DD 0.0
	@@allequal 	DD 0.0
	@null 	DD -1.0

.CODE
.startup
	mov AX,@DATA
	mov DS,AX

	FINIT

	FLD +
	FLD 1
	FADD
	FLD +
	FLD B
	FADD
	FLD +
	FLD @term2
	FADD
	FLD +
	FLD 1
	FADD
	FLD +
	FLD @term2
	FADD
	FLD +
	FLD 1
	FADD
	FLD +
	FLD *
	FADD
	mov ah, 4ch
	int 21h

;FIN DEL PROGRAMA DE USUARIO
