:: Script para windows
del intermedio.txt
flex Lexico.l
bison -dyv Sintactico.y

gcc.exe lex.yy.c y.tab.c -o lyc-compiler-2.0.0.exe

lyc-compiler-2.0.0.exe test.txt

@type prueba.txt
@echo.
@type intermedio.txt
@echo.

@echo off
del lyc-compiler-2.0.0.exe
del lex.yy.c
del y.tab.c
del y.tab.h
del y.output


pause

