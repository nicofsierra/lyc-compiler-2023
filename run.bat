PATH=C:\TASM;

tasm numbers.asm
tasm number.asm
tasm macros2.asm
tasm final.asm
tlink final.obj numbers.obj
final.exe
del final.obj 
del numbers.obj 
del number.obj 
del macros2.obj 
del final.exe
del final.map