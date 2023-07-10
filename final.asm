include macros2.asm
include number.asm

.MODEL LARGE
.STACK 200h
MAXTEXTSIZE equ 50
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
	@_5 	DD 5.0
	@_m10 	DD -10.0
	@_2p3 	DD 2.3
	@_1 	DD 1.0
	@_mp4 	DD -0.4
	@__HOLA_ 	DB "_HOLA_",'$',44 dup(?)
	@_4 	DD 4.0
	@_9 	DD 9.0
	@_3 	DD 3.0
	@_1p1 	DD 1.1
	@aux1 	DD 0.0
	@aux2 	DD 0.0
	@exp1 	DD 0.0
	@exp2 	DD 0.0
	@exp3 	DD 0.0
	@exp4 	DD 0.0
	@exp5 	DD 0.0
	@null 	DD -1.0

.CODE
.startup
	START:
	mov AX,@DATA
	mov DS,AX

	FLD @_5
	FST @A
	FLD @_m10
	FST @B
	FLD @A
	FLD @_2p3
	FMUL
	FST @exp1
	FLD @exp1
	FLD @_1
	FADD
	FST @exp2
	FLD @exp2
	FST @E
	FLD @_2p3
	FST @H
	FLD @_mp4
	FST @R2
	mov ax, @DATA
	mov ds, ax
	mov es, ax
	mov si, OFFSET @__HOLA_
	mov di, OFFSET @G
	call copiar
	FLD @A
	FLD @B
	FADD
	FST @exp3
	FLD @_5
	FLD @exp3
	FMUL
	FST @exp4
	FLD @exp4
	FST @Z
	FLD @A
	FST @aux1
	FLD @_4
	FST @aux2
	FLD @B
	FST @aux1
	FLD @_9
	FST @aux2
	FLD @_5
	FST @D
	FLD @A
	FST @aux1
	FLD @_4
	FST @aux2
	FLD @B
	FST @aux1
	FLD @_9
	FST @aux2
	FLD @A
	FST @aux1
	FLD @_4
	FST @aux2
	FLD @_5
	FST @D
	FLD @A
	FST @aux1
	FLD @_3
	FST @aux2
	FLD @_4
	FST @D
	FLD @_3
	FST @C
	FLD @E
	FST @aux1
	FLD @B
	FST @aux2
	FLD @_1p1
	FST @E
	FLD @A
	FST @aux1
	FLD @B
	FST @aux2
	FLD @_1
	FST @A

;FIN DEL PROGRAMA DE USUARIO

strlen proc
	mov bx, 0
	strl01:
	cmp BYTE PTR [si+bx],'$'
	je strend
	inc bx
	jmp strl01
	strend:
	ret
strlen endp

copiar proc
	call strlen
	cmp bx , MAXTEXTSIZE
	jle copiarSizeOk
	mov bx , MAXTEXTSIZE
	copiarSizeOk:
	mov cx , bx
	cld
	rep movsb
	mov al , '$'
	mov byte ptr[di],al
	ret
copiar endp

concat proc
	push ds
	push si
	call strlen
	mov dx , bx
	mov si , di
	push es
	pop ds
	call strlen
	add di, bx
	add bx, dx
	cmp bx , MAXTEXTSIZE
	jg concatSizeMal
	concatSizeOk:
	mov cx , dx
	jmp concatSigo
	concatSizeMal:
	sub bx , MAXTEXTSIZE
	sub dx , bx
	mov cx , dx
	concatSigo:
	push ds
	pop es
	pop si
	pop ds
	cld
	rep movsb
	mov al , '$'
	mov byte ptr[di],al
	ret
concat endp
	mov ah, 4ch
	int 21h

END START