%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
//#include "ts.h"

int yystopparser=0;
FILE  *yyin;
int yyerror();
int yylex();
int crear_TS();
char *buffer;

%}

%union
 {
 char* cadena;
 int numero;
 	char*vals;
 }


%token CTE_E
%token CTE_R
%token ID
%token OP_ASIG   
%token OP_SUM
%token OP_MUL      
%token OP_RES
%token OP_DIV      
%token LA          
%token LC
%token PARA
%token PARC
%token CORA
%token CORC
%token AND 
%token OR
%token CO_IGUAL
%token CO_DIST
%token CO_MENI
%token CO_MEN
%token CO_MAYI
%token CO_MAY
%token IF
%token ELSE
%token CICLO
%token CTE_S 			
%token DP				
%token PC				
%token COMA
%token PUNTO
%token INIT
%token INT
%token FLOAT
%token STRING
%token READ
%token WRITE
%token NOT
%token FIB

%%
start:
		programa {printf(" Fin del Programa\n"); }
;
programa:
		sentencia {printf(" Sentencia es Programa\n"); } 
		| programa sentencia {printf( " Programa y Sentencia es Programa\n");}
		;
		
sentencia:
		asignacion	{ printf(" Asignacion es Sentencia\n");}
		| iteracion { printf(" Iteracion es Sentencia\n"); }
		| seleccion { printf(" Seleccion es Sentencia\n"); }
		| zonadec { printf(" Zona Declaracion es Sentencia\n"); }
		| read { printf("Read es Sentencia\n"); }
		| write { printf("Write es Sentencia\n"); }
		;

asignacion:
		ID OP_ASIG expresion { printf(" ID = Expresion es Asignacion\n"); }
		| ID OP_ASIG constante_string {printf(" ID = Constante String es Asignacion\n");; }
		;

seleccion:
		IF PARA condicion PARC bloque_seleccion {printf(" IF (Condicion) Bloque Seleccion es Seleccion\n");}
		;

bloque_seleccion: 
	LA programa LC {printf(" {Programa}  es Bloque Seleccion\n"); }
	| LA programa LC bloque_else {printf("{Programa} ELSE {Programa}  Bloque Else Es Bloque Seleccion\n"); }
	;
	
bloque_else:
	ELSE LA programa LC {printf("ELSE {Programa} Es Bloque Else\n"); }
	;

iteracion:
		CICLO PARA condicion PARC LA programa LC {printf(" WHILE (Condicion) { programa } es Iteracion\n"); }
		;

condicion:
		  comparacion AND comparacion {printf(" Comparacion AND Comparacion es Condicion\n"); }
		| comparacion OR comparacion {printf(" Comparacion OR Comparacion es Condicion\n");} 
		| comparacion {printf(" Comparacion es Condicion\n"); }
		;
		
comparacion:
		expresion comparador expresion {printf(" Expresion Comparador Expresion es Comparacionn\n"); }
		| NOT expresion comparador expresion {printf(" NOT Expresion Comparador Expresion es Comparacion\n"); }
		;
		
comparador:
		CO_IGUAL {printf(" == es Comparador\n"); }
		| CO_DIST {printf(" != es Comparador\n"); }
		| CO_MENI  {printf(" <= es Comparador\n"); }
		| CO_MEN {printf(" < es Comparador\n"); }
		| CO_MAYI  {printf(" >= es Comparador\n"); }
		| CO_MAY   {printf(" > es Comparador\n"); }
		;

expresion:
		expresion OP_SUM termino { printf(" Expresion + Termino es Expresion\n");}
		| expresion OP_RES termino {printf(" Expresion - Termino es Expresion\n"); }
		| termino {printf(" Termino es Expresion\n"); }
		;
		
termino:
		termino OP_MUL factor {printf(" Termino * Factor es Termino\n"); }
		| termino OP_DIV factor {printf(" Termino / Factor es Termino\n"); }
		| factor {printf(" Factor es Termino\n"); }
		;
		
factor:
		PARA  expresion PARC {printf(" ( Expresion ) es Factor\n"); }
		| ID {printf(" ID es Factor\n"); }
		| CTE_E {printf(" CTE_E es Factor\n"); }
		| CTE_R {printf(" CTE_R es Factor\n");  }
		| FIB PARA CTE_E PARC { printf(" FIB ( CTE_E ) es Factor\n"); }
		;
		
zonadec:
		INIT LA bloque_declaracion LC {printf (" INIT { Bloque Declaracion } es Zonadec\n"); }
		;
		
bloque_declaracion:
		bloque_declaracion declaracion { printf ( " Bloque Declaracion y Declaracion es Bloque Declaracion\n"); }
		| declaracion { printf(" Declaracion es Bloque Declaracion\n"); }
		;
		
declaracion:
		multiple_dec DP tipo { printf(" Multiple Declaracion: Tipo es Declaracion\n"); }
		;
		
multiple_dec:
		multiple_dec COMA variable { printf(" Multiple Declaracion , Variable es Multiple Declaracion\n"); } 
		| variable { printf(" Variable es Multiple Declaracion\n"); } 
		;
		
variable:
		ID { printf(" ID es Variable\n"); } 
		;
		
tipo:
		FLOAT {printf (" FLOAT es Tipo\n"); } 
		| INT {printf (" INT es Tipo\n"); }
		| STRING {printf (" STRING es Tipo\n"); }
		;
		
constante_string:
		CTE_S { printf (" CTE_S es Constante String\n");}
		;

read:
		READ PARA CTE_S PARC{ printf(" READ (CTE_S) es Read\n"); }
		| READ PARA CTE_E PARC{printf(" READ (CTE_E) es Read\n"); }
		| READ PARA ID PARC {printf(" READ (ID) es Read\n"); }
		| READ PARA CTE_R PARC{printf(" READ (CTE_R) es Read\n"); }
		;
write:
		WRITE PARA CTE_S PARC{ printf(" WRITE (CTE_S) es Write\n"); }
		| WRITE PARA CTE_E PARC{printf(" WRITE (CTE_E) es Write\n"); }
		| WRITE PARA ID PARC{printf(" WRITE (ID) es Write\n"); }
		| WRITE PARA CTE_R PARC{printf(" WRITE (CTE_R) es Write\n"); }
		;
%%


int main(int argc, char *argv[])
{
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
    }
    else
    { 
        
        yyparse();
        
    }
	
	fclose(yyin);
	crear_TS();
		
    return 0;
}

int yyerror(void)
{
	printf("Error Sintactico\n");
	exit (1);
}
