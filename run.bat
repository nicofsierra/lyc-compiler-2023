PATH=C:\TASM;

tasm numbers.asm
tasm /m2 final.asm
tlink final.obj numbers.obj
ejemplo.exe
del final.obj 
del numbers.obj 
del final.exe
del final.map