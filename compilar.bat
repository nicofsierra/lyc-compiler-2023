:: Script para windows

flex Lexico.l
:: bison -dyv Sintactico.y

gcc.exe lex.yy.c -o lyc-compiler-1.0.0.exe

lyc-compiler-1.0.0.exe test.txt

@echo off
del lyc-compiler-1.0.0.exe
del lex.yy.c

pause

