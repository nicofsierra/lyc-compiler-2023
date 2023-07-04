%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

//pila
typedef struct nodo {
   int dato;
   struct nodo *siguiente;
} tipoNodo;

typedef tipoNodo *pNodo;
typedef tipoNodo *tPila;

tPila pila_comp;
tPila pila_ciclo;
tPila pila_fib;
tPila pila_sel;
int indiceTemp;

//funciones pila
void crear_pila( tPila * );
void apilar(int , tPila *);
int desapilar(tPila *);

int yystopparser=0;
FILE  *yyin;
int yyerror();
int yylex();
int crear_TS();

//polaca
char *polaca[100];
int indice = 0;
void insertar_polaca(char *);
void exportar();
void ver_polaca();
void escribir_polaca(char *,int );
int notc = 0;
char *comp;
char *notcomp;

//manejo de cadenas
char *convertir( int );
char *copiar( char * );

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
		programa {printf("Fin del Programa\n"); exportar(); ver_polaca();}
;
programa:
		sentencia {printf("R1: programa -> sentencia \n"); } 
		| programa sentencia {printf( "R2: programa -> programa sentencia \n");}
		;
		
sentencia:
		asignacion	{ printf("R3: sentencia -> asignacion ");}
		| iteracion { printf("R4: sentencia -> iteracion \n"); }
		| seleccion { printf("R5: sentencia -> seleccion \n"); }
		| zonadec { printf("R6: sentencia -> zonadec \n"); }
		| read { printf("R7: sentencia -> read \n"); }
		| write { printf("R8: sentencia -> write \n"); }
		;

asignacion:
		ID OP_ASIG expresion { 
			printf("R9: asignacion -> ID = expresion \n"); 
			insertar_polaca($1);
			insertar_polaca($2);
		}
		| ID OP_ASIG constante_string {
			printf("R10: asignacion -> ID = cte_s \n"); 
			insertar_polaca($1);
			insertar_polaca($2);
		}
		;

seleccion:
		IF PARA condicion PARC { apilar(indice, &pila_sel);} bloque_seleccion {printf("R10: seleccion -> IF ( condicion )\n"); escribir_polaca( convertir(indice), desapilar(&pila_sel)); }
		;

bloque_seleccion: 
	LA programa LC {printf("R11: bloque_seleccion -> {programa} \n"); escribir_polaca( convertir(indice), desapilar(&pila_comp));escribir_polaca(convertir(indice), desapilar(&pila_sel));}
	| LA programa LC {escribir_polaca( convertir(indice), desapilar(&pila_sel));insertar_polaca("BI");apilar(indice,&pila_sel);indice++;escribir_polaca( convertir(indice), desapilar(&pila_comp));} bloque_else {escribir_polaca(convertir(indice), desapilar(&pila_sel));printf("R12: bloque_seleccion -> {Programa} bloque_else\n"); }
	;
	
bloque_else:
	ELSE LA programa LC {printf("\nR13: bloque_else -> ELSE {Programa}\n"); }
	;

iteracion:
		CICLO {apilar(indice,&pila_ciclo); insertar_polaca("ET");   }PARA condicion PARC LA programa LC {printf("R14: iteracion -> CICLO (Condicion) { programa }\n"); 
		insertar_polaca("BI"); insertar_polaca(convertir(desapilar(&pila_ciclo))); while(pila_comp!=NULL){ escribir_polaca( convertir(indice), desapilar(&pila_comp)); } }
		;

condicion:
		  comparacion {insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); if( notc == 0) insertar_polaca(comp); else insertar_polaca(notcomp);
					   apilar(indice,&pila_comp); indice++;}
		  AND comparacion {printf("R15: condicion -> comparacion AND comparacion n"); insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); 
																					  if( notc == 0) insertar_polaca(comp); else insertar_polaca(notcomp);
																					  apilar(indice,&pila_comp); indice++;}
		| comparacion {insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); if( notc == 0) insertar_polaca(comp); else insertar_polaca(notcomp);
					   insertar_polaca(convertir(indice+1));}
		  OR comparacion {printf("R16: condicion -> comparacion OR comparacion\n"); insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); 
																					  if( notc == 0) insertar_polaca(comp); else insertar_polaca(notcomp);
																					  apilar(indice,&pila_comp); indice++; } 
		| comparacion {printf("R17: condicion -> comparacion\n"); insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP");
																  if( notc == 0) insertar_polaca(comp); else insertar_polaca(notcomp); apilar(indice,&pila_comp); indice++; }
		;
		
comparacion:
		{notc = 0; } expresion { insertar_polaca("@aux1"); insertar_polaca("="); } comparador expresion {printf("R18: comparacion -> expresion comparador expresion\n"); 
																						 insertar_polaca("@aux2"); insertar_polaca("="); }
		| {notc = 1; }NOT expresion { insertar_polaca("@aux1"); insertar_polaca("="); }  comparador expresion {printf("\nR19: comparacion -> NOT expresion comparador expresion\n");
																						 insertar_polaca("@aux2"); insertar_polaca("="); }
		;
		
comparador:
		CO_IGUAL {printf("R20: comparador -> ==\n"); comp = copiar("BNE"); notcomp = copiar("BEQ");/*sprintf(comp,"%s","BNE"); sprintf(notcomp,"%s","BEQ");*/}
		| CO_DIST {printf("R21: comparador -> !=\n"); comp = copiar("BEQ"); notcomp = copiar("BNE");/*sprintf(comp,"%s","BEQ"); sprintf(notcomp,"%s","BNE");*/}
		| CO_MENI  {printf("R22: comparador -> <=\n"); comp = copiar("BGT"); notcomp = copiar("BGE");/*sprintf(comp,"%s","BGT"); sprintf(notcomp,"%s","BGE");*/}
		| CO_MEN {printf("R23: comparador -> <\n"); comp = copiar("BGE"); notcomp = copiar("BGT");/*sprintf(comp,"%s","BGE"); sprintf(notcomp,"%s","BGT");*/}
		| CO_MAYI  {printf("R24: comparador -> >=\n"); comp = copiar("BLT"); notcomp = copiar("BLE");/*sprintf(comp,"%s","BLT"); sprintf(notcomp,"%s","BLE");*/}
		| CO_MAY   {printf("R25: comparador -> >\n"); comp = copiar("BLE"); notcomp = copiar("BLT");/*sprintf(comp,"%s","BLE"); sprintf(notcomp,"%s","BLT");*/}
		;

expresion:
		expresion OP_SUM termino { printf("R26: expresion -> expresion + termino\n"); insertar_polaca($2);}
		| expresion OP_RES termino {printf("R27: expresion -> expresion - termino\n"); insertar_polaca($2);}
		| termino {printf("R28: expresion -> termino es expresion\n"); }
		;
		
termino:
		termino OP_MUL factor {printf("R29: termino -> termino * factor\n"); insertar_polaca($2);}
		| termino OP_DIV factor {printf("R30: termino -> termino / factor\n"); insertar_polaca($2);}
		| factor {printf("R31: termino -> factor es termino\n"); }
		;
		
factor:
		PARA  expresion PARC {printf("R32: factor -> ( expresion )\n"); }
		| ID {printf("R33: factor -> ID\n"); insertar_polaca($1); }
		| CTE_E {printf("R34: factor -> CTE_E\n"); insertar_polaca($1);}
		| CTE_R {printf("R35: factor -> CTE_R\n"); insertar_polaca($1); }
		| FIB PARA CTE_E PARC { printf("R36: factor -> FIB ( CTE_E )\n"); insertar_polaca("0"); insertar_polaca("@cont"); insertar_polaca("=");
																insertar_polaca("0"); insertar_polaca("@ret"); insertar_polaca("=");
																insertar_polaca("0"); insertar_polaca("@term1"); insertar_polaca("=");
																insertar_polaca("1"); insertar_polaca("@term2"); insertar_polaca("=");
																apilar(indice,&pila_fib); insertar_polaca("ET"); insertar_polaca("@cont"); insertar_polaca($3);
																insertar_polaca("CMP"); insertar_polaca("BGE"); insertar_polaca("@term1"); insertar_polaca("@term2");
																insertar_polaca("+"); insertar_polaca("@ret"); insertar_polaca("="); 
																insertar_polaca("@term2"); insertar_polaca("@term1"); insertar_polaca("="); 
																insertar_polaca("@ret"); insertar_polaca("@term2"); insertar_polaca("="); 
																insertar_polaca("@cont"); insertar_polaca("1"); insertar_polaca("+");
																insertar_polaca("@cont"); insertar_polaca("="); insertar_polaca("BI"); 
																insertar_polaca(convertir(desapilar(&pila_fib))); insertar_polaca("@ret"); 
																insertar_polaca("@fib"); insertar_polaca("="); 
																}
		;
		
zonadec:
		INIT LA bloque_declaracion LC {
			printf ("R37: zonadec -> INIT { bloque_declaracion }\n");
			insertar_polaca($1);
		}
		;
		
bloque_declaracion:
		bloque_declaracion declaracion { printf ( "R38: bloque_declaracion -> bloque_declaracion declaracion\n"); }
		| declaracion { printf("R39: bloque_declaracion -> declaracion\n"); }
		;
		
declaracion:
		multiple_dec DP tipo { printf("R40: declaracion -> multiple_dec : tipo\n"); insertar_polaca($2); }
		;
		
multiple_dec:
		multiple_dec COMA variable { printf("R41: multiple_dec -> multiple_dec , variable\n"); insertar_polaca($2); } 
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
		READ PARA CTE_S PARC{ printf("R48: read -> READ (CTE_S)\n"); insertar_polaca($1); insertar_polaca($3);}
		| READ PARA CTE_E PARC{printf("R49: read -> READ (CTE_E)\n"); insertar_polaca($1); insertar_polaca($3);}
		| READ PARA ID PARC {printf("R50: read -> READ (ID)\n"); insertar_polaca($1); insertar_polaca($3);}
		| READ PARA CTE_R PARC{printf("R51: read -> READ (CTE_R)\n"); insertar_polaca($1); insertar_polaca($3);}
		;
write:
		WRITE PARA CTE_S PARC{ printf("R51: write -> WRITE (CTE_S)\n"); insertar_polaca($1); insertar_polaca($3);}
		| WRITE PARA CTE_E PARC{printf("R52: write -> WRITE (CTE_E)\n"); insertar_polaca($1); insertar_polaca($3);}
		| WRITE PARA ID PARC{printf("R53: write -> WRITE (ID)\n"); insertar_polaca($1); insertar_polaca($3);}
		| WRITE PARA CTE_R PARC{printf("R54: write -> WRITE (CTE_R)\n"); insertar_polaca($1); insertar_polaca($3); }
		;
%%


int main(int argc, char *argv[]) {
	crear_pila(&pila_comp);
	crear_pila(&pila_ciclo);
	crear_pila(&pila_fib);
	crear_pila(&pila_sel);
	
    if((yyin = fopen(argv[1], "rt"))==NULL) {
        printf("\n\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
    } else { 
        yyparse();
    }
	
	fclose(yyin);
	crear_TS();
		
    return 0;
}

int yyerror(void) {
	printf("\nError Sintactico\n");
	exit (1);
}

void insertar_polaca(char *dato) {
	polaca[indice] = dato;

	indice++;
}

void escribir_polaca(char *dato,int pos) {
	polaca[pos] = dato;
}

void exportar() {
	int i;
	FILE *archivo;
	archivo = fopen("intermedio.txt","a");
	for (i = 0 ; i < indice ; i++){
		
		/*printf( "%d- %s\n",i,polaca[i]);*/
		fprintf( archivo , "posicion:%d  | %s |\n", i, polaca[i] );
	}

	fclose(archivo);
}

void ver_polaca() {
	int i;
	printf("---POLACA INVERSA---\n");
	printf("| ");

	for (i = 0; i < indice; i++) {
		printf("%s | ", polaca[i]);
	}

	printf("\n--------------------\n");
}

char *convertir( int a ) {
	char *buffer = malloc(2);
	sprintf(buffer,"%d",a);

	return buffer;
}

char *copiar( char *dato ) {
	char *buffer_cpy = malloc(4);
	sprintf(buffer_cpy,"%s",dato);
	return buffer_cpy;
}

void crear_pila( tPila *nodo ) {
	*nodo = NULL;
}

void apilar(int v, tPila *pila) {
   pNodo nuevo;

   nuevo = (pNodo)malloc(sizeof(tipoNodo));
   nuevo->dato = v;
   
   nuevo->siguiente = *pila;
   *pila = nuevo;
}

int desapilar(tPila *pila) {
   pNodo nodo; 
   int v;      

   nodo = *pila;
   
   if(!nodo) return 0; 
  
   *pila = nodo->siguiente;
   
   v = nodo->dato;
   free(nodo);

   return v;
}

/*void vaciarPila( tPila *pila)
{
	free(*pila);
}*/

/*void generar_asm();
{
	FILE *archivo;
	int i = 0;
	archivo = fopen("final.asm","a");
	for ( i = 0 ; i < indice ; i++){
		if( polaca[i] == "ET" )
		{
			fprintf( archivo , "ciclo:" );
		}
		if( polaca[i] = "
	}
	fclose(archivo);
	
}*/
