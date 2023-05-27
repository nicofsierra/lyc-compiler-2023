%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
//#include "ts.h"

// tipo de datos pila
struct Nodo
{
	int dato;
	struct Nodo *sig;
};

int yystopparser=0;
FILE  *yyin;
int yyerror();
int yylex();
int crear_TS();

//manejo conversiontes tipo
char buffer[10];

//polaca
char *polaca[100];
int indice = 0;
void insertar_polaca();
void exportar();
int pos_salto=0;
void escribir_polaca(char *,int );

//pilas
struct Nodo *pila_pos = NULL;
struct Nodo *pila_pol = NULL;

//funciones de la pila
struct Nodo *crea_nodo( void );
struct Nodo *apilar();
struct Nodo *desapilar();

%}

%union
 {
 char *cadena;
}


%token<cadena> CTE_E
%token<cadena> CTE_R
%token<cadena> ID
%token<cadena> OP_ASIG   
%token<cadena> OP_SUM
%token<cadena> OP_MUL      
%token<cadena> OP_RES
%token<cadena> OP_DIV      
%token<cadena> LA          
%token<cadena> LC
%token<cadena> PARA
%token<cadena> PARC
%token<cadena> CORA
%token<cadena> CORC
%token<cadena> AND 
%token<cadena> OR
%token<cadena> CO_IGUAL
%token<cadena> CO_DIST
%token<cadena> CO_MENI
%token<cadena> CO_MEN
%token<cadena> CO_MAYI
%token<cadena> CO_MAY
%token<cadena> IF
%token<cadena> ELSE
%token<cadena> CICLO
%token<cadena> CTE_S 			
%token<cadena> DP				
%token<cadena> PC				
%token<cadena> COMA
%token<cadena> PUNTO
%token<cadena> INIT
%token<cadena> INT
%token<cadena> FLOAT
%token<cadena> STRING
%token<cadena> READ
%token<cadena> WRITE
%token<cadena> NOT
%token<cadena> FIB

%%
start:
		programa {printf("Fin del Programa\n"); exportar();}
;
programa:
		sentencia {printf("R1: programa -> sentencia \n"); } 
		| programa sentencia {printf( "R2: programa -> programa sentencia \n");}
		;
		
sentencia:
		asignacion	{ printf("R3: S -> A ");}
		| iteracion { printf("R4: S -> I \n"); }
		| seleccion { printf("R5: S -> seleccion \n"); }
		| zonadec { printf("R6: S -> zonadec \n"); }
		| read { printf("R7: S -> A \n"); }
		| write { printf("R8: S -> A \n"); }
		;

asignacion:
		ID OP_ASIG expresion { printf("R9: asignacion -> ID = expresion \n"); }
		| ID OP_ASIG constante_string {printf("R10: asignacion -> ID = cte_s \n");; }
		;

seleccion:
		IF PARA condicion PARC bloque_seleccion {printf("R10: seleccion -> IF ( condicion )\n");}
		;

bloque_seleccion: 
	LA programa LC {printf("R11: bloque_seleccion -> {programa} \n"); }
	| LA programa LC bloque_else {printf("R12: bloque_seleccion -> {Programa} ELSE {Programa} bloque_else\n"); }
	;
	
bloque_else:
	ELSE LA programa LC {printf("\nR13: bloque_else -> ELSE {Programa}\n"); }
	;

iteracion:
		CICLO PARA condicion PARC LA programa LC {printf("R14: iteracion -> CICLO (Condicion) { programa }\n"); }
		;

condicion:
		  comparacion AND comparacion {printf("R15: condicion -> comparacion AND comparacion n"); }
		| comparacion OR comparacion {printf("R16: condicion -> comparacion OR comparacion\n");} 
		| comparacion {printf("R17: condicion -> comparacion\n"); }
		;
		
comparacion:
		expresion comparador expresion {printf("R18: comparacion -> expresion comparador expresion\n"); }
		| NOT expresion comparador expresion {printf("\nR19: comparacion -> NOT expresion comparador expresion\n"); }
		;
		
comparador:
		CO_IGUAL {printf("R20: comparador -> ==\n"); }
		| CO_DIST {printf("R21: comparador -> !=\n"); }
		| CO_MENI  {printf("R22: comparador -> <=\n"); }
		| CO_MEN {printf("R23: comparador -> <\n"); }
		| CO_MAYI  {printf("R24: comparador -> >=\n"); }
		| CO_MAY   {printf("R25: comparador -> >\n"); }
		;

expresion:
		expresion OP_SUM termino { printf("R26: expresion -> expresion + termino\n");}
		| expresion OP_RES termino {printf("R27: expresion -> expresion - termino\n"); }
		| termino {printf("R28: expresion -> termino es expresion\n"); }
		;
		
termino:
		termino OP_MUL factor {printf("R29: termino -> termino * factor\n"); }
		| termino OP_DIV factor {printf("R30: termino -> termino / factor\n"); }
		| factor {printf("R31: termino -> factor es termino\n"); }
		;
		
factor:
		PARA  expresion PARC {printf("R32: factor -> ( expresion )\n"); }
		| ID {printf("R33: factor -> ID\n"); }
		| CTE_E {printf("R34: factor -> CTE_E\n"); }
		| CTE_R {printf("R35: factor -> CTE_R\n");  }
		| FIB PARA CTE_E PARC { printf("R36: factor -> FIB ( CTE_E )\n"); }
		;
		
zonadec:
		INIT LA bloque_declaracion LC {printf ("R37: zonadec -> INIT { bloque_declaracion }\n"); }
		;
		
bloque_declaracion:
		bloque_declaracion declaracion { printf ( "R38: bloque_declaracion -> bloque_declaracion declaracion\n"); }
		| declaracion { printf("R39: bloque_declaracion -> declaracion\n"); }
		;
		
declaracion:
		multiple_dec DP tipo { printf("R40: declaracion -> multiple_dec: tipo\n"); }
		;
		
multiple_dec:
		multiple_dec COMA variable { printf("R41: multiple_dec -> multiple_dec , variable\n"); } 
		| variable { printf("R42: multiple_dec -> variable\n"); } 
		;
		
variable:
		ID { printf("R43: variable -> ID\n"); insertar_polaca($1); } 
		;
		
tipo:
		FLOAT {printf ("R44: tipo -> FLOAT\n"); insertar_polaca($1);} 
		| INT {printf ("R45: tipo -> INT\n"); insertar_polaca($1);}
		| STRING {printf ("R46: tipo -> STRING\n"); insertar_polaca($1); }
		;
		
constante_string:
		CTE_S { printf ("R47: constante_string -> CTE_S\n"); insertar_polaca($1);}
		;

read:
		READ PARA CTE_S PARC{ printf("R48: read -> READ (CTE_S)\n"); }
		| READ PARA CTE_E PARC{printf("R49: read -> READ (CTE_E)\n"); }
		| READ PARA ID PARC {printf("R50: read -> READ (ID)\n"); }
		| READ PARA CTE_R PARC{printf("R51: read -> READ (CTE_R)\n"); }
		;
write:
		WRITE PARA CTE_S PARC{ printf("R51: write -> WRITE (CTE_S)\n"); insertar_polaca($1); insertar_polaca($3);}
		| WRITE PARA CTE_E PARC{printf("R52: write -> WRITE (CTE_E)\n"); insertar_polaca($1); insertar_polaca($3);}
		| WRITE PARA ID PARC{printf("R53: write -> WRITE (ID)\n"); insertar_polaca($1); insertar_polaca($3);}
		| WRITE PARA CTE_R PARC{printf("R54: write -> WRITE (CTE_R)\n"); insertar_polaca($1); insertar_polaca($3); }
		;
%%


int main(int argc, char *argv[])
{
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\n\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
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
	printf("\nError Sintactico\n");
	exit (1);
}

void insertar_polaca(char *dato){
	polaca[indice] = dato;
	indice = indice + 1;
}

void escribir_polaca(char *dato,int pos){
	polaca[pos] = dato;
	printf("polaca[14]=%s--polaca[25]=%s\n",polaca[14],polaca[25]);
}


void exportar(){
	FILE *archivo;
	int i = 0;
	archivo = fopen("intermedio.txt","a");
	for ( i = 0 ; i < indice ; i++){
		printf( "%d- %s\n",i,polaca[i]);
		fprintf( archivo , "%s", polaca[i] );
	}
	fclose(archivo);
}

struct Nodo *crea_nodo( void )
{
	struct Nodo *nuevo = malloc(sizeof(struct Nodo ));
	return nuevo ;
}

struct Nodo *apilar( int indice , struct Nodo *p )
{
	struct Nodo *nuevo = crea_nodo( ) ;
	if(!nuevo)
		printf("\nNo hay memoria");
	else
	{
		nuevo->dato = indice ;
		nuevo->sig = p ;
		p = nuevo;
	}
	return p;
}

struct Nodo *desapilar( struct Nodo *p)
{
	if( p != NULL )
	{
		struct Nodo *temporal = p;
		p = p->sig;
		free(temporal);
	}
	return (p);
}
