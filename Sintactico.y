%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

//estructuras
typedef struct {
	char *nombre;
	char *tipo;
	int valor;
	float valor_f;
	unsigned int longitud;
	int usada;
}var;

var lista_variables[100];
var lista_constantes[100];
var lista_id[100];
var lista_auxiliares[100];
var lista_inout[100];

//pila
typedef struct nodo {
   int dato;
   struct nodo *siguiente;
} tipoNodo;

typedef struct nodo_c{
   char * dato;
   struct nodo_c *siguiente;
} tipoNodo_c;

typedef tipoNodo *pNodo;
typedef tipoNodo_c *pNodo_c;
typedef tipoNodo *tPila;
typedef tipoNodo_c *tPila_c;

tPila pila_comp;
tPila pila_ciclo;
tPila pila_fib;
tPila pila_sel;
tPila pila_bi;
tPila_c pila_op;
int indiceTemp;

//funciones pila
void crear_pila( tPila * );
void apilar(int , tPila *);
int desapilar(tPila *);

void crear_pila_c( tPila_c * );
void apilar_c(char * , tPila_c *);
char *desapilar_c(tPila_c *);

int yystopparser=0;
FILE  *yyin;
int yyerror();
int yylex();
int crear_TS();
struct struct_tablaSimbolos obtener_TS(char*);

//polaca
char *polaca[1000];
int indice = 0;

//funciones
void generar_asm();
void insertar_polaca(char *);
void exportar();
void ver_polaca();
void escribir_polaca(char *,int );
void recorrerPolaca(FILE *);
int esOperando(char *);
int verficarDeclaracion(char *);
int verificarCtesRepetidas(char *);
int verificarTipo(int, char *);
int esEntradaSalida(char *);
char *obtenerTipo( char *);
char *reemplazarMenos(char *);
char *reemplazarPunto(char *);
char *reemplazarComillas(char *);
int marcarVariable(char *);

//manejo de cadenas
char *convertir( int );
char *copiar( char * );

//variables
int indice_variables = 0;
int indice_constantes = 0;
int indice_auxiliares = 0;
int indice_inout = 0;
int indice_id = 0;
int total_tipos = 0;
char *tipo;
char *var_asig;
int notc = 0;
char *comp;
char *notcomp;
int tipo_validar;

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

		programa {printf("Fin del Programa\n"); exportar(); generar_asm();}
;
programa:
		sentencia {printf("R1: programa -> sentencia \n"); } 
		| programa sentencia {printf( "R2: programa -> programa sentencia \n");}
		;
		
sentencia:
		asignacion	{ printf("R3: sentencia -> asignacion \n");}
		| iteracion { printf("R4: sentencia -> iteracion \n"); }
		| seleccion { printf("R5: sentencia -> seleccion \n"); }
		| zonadec { printf("R6: sentencia -> zonadec \n"); }
		| read { printf("R7: sentencia -> read \n"); }
		| write { printf("R8: sentencia -> write \n"); }
		;

asignacion:
		ID OP_ASIG expresion { 
			printf("R9: asignacion -> ID(%s) = expresion \n",$1); 
			if( verficarDeclaracion($1) == 0 ) {printf("\n\n\tError: Variable %s no inicializada\n",$1); return -1;} 
			if( verificarTipo(tipo_validar,$1) == 0 ) {printf("\n\n\tError: Tipos variable %s no compatibles\n",$1); return -1; } tipo_validar = 0 ;
			marcarVariable($1);
			insertar_polaca($1);
			insertar_polaca($2);
		}
		| ID OP_ASIG constante_string {
			printf("R10: asignacion -> ID = cte_s \n"); 
			if( verficarDeclaracion($1) == 0 ) {printf("\n\n\tVariable %s no inicializada\n",$1); return -1;}
			if( verificarTipo(tipo_validar,$1) == 0 ) {printf("\n\n\tError: Tipos variable %s no compatibles\n",$1); return -1;} tipo_validar = 0 ;
			marcarVariable($1);
			insertar_polaca($1);
			insertar_polaca($2);
		}
		;
		
seleccion:

		IF PARA condicion PARC LA programa LC { escribir_polaca( convertir(indice), desapilar(&pila_comp)); printf("R11: bloque_seleccion -> {programa} \n"); }
		| IF PARA condicion PARC LA programa LC { insertar_polaca("BI"); apilar( indice , &pila_bi); indice++; escribir_polaca( convertir(indice), desapilar(&pila_comp)); } 
		ELSE LA programa LC { printf("R12: bloque_seleccion -> {Programa} ELSE {Programa} bloque_else\n"); escribir_polaca( convertir(indice), desapilar(&pila_bi) );  }
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
		CO_IGUAL {printf("R20: comparador -> ==\n"); comp = copiar("BNE"); notcomp = copiar("BEQ");}
		| CO_DIST {printf("R21: comparador -> !=\n"); comp = copiar("BEQ"); notcomp = copiar("BNE");}
		| CO_MENI  {printf("R22: comparador -> <=\n"); comp = copiar("BGT"); notcomp = copiar("BLT");}
		| CO_MEN {printf("R23: comparador -> <\n"); comp = copiar("BGE"); notcomp = copiar("BGT");}
		| CO_MAYI  {printf("R24: comparador -> >=\n"); comp = copiar("BLT"); notcomp = copiar("BLE");}
		| CO_MAY   {printf("R25: comparador -> >\n"); comp = copiar("BLE"); notcomp = copiar("BLT");}
		;

expresion:
		expresion OP_SUM termino {printf("R26: expresion -> expresion + termino\n"); insertar_polaca($2);}
		| expresion OP_RES termino {printf("R27: expresion -> expresion - termino\n"); insertar_polaca($2);}
		| termino {printf("R28: expresion -> termino es expresion\n"); }
		;
		
termino:
		termino OP_MUL factor {printf("R29: termino -> termino * factor\n"); insertar_polaca($2);}
		| termino OP_DIV factor {printf("R30: termino -> termino / factor\n"); insertar_polaca($2); tipo_validar = 1; }
		| factor {printf("R31: termino -> factor es termino\n"); }
		;
		
factor:
		PARA  expresion PARC {printf("R32: factor -> ( expresion )\n"); }
		| ID {printf("R33: factor -> ID\n"); insertar_polaca($1); lista_id[indice_id].nombre = copiar($1); indice_id++;}
		| CTE_E {printf("R34: factor -> CTE_E(%s)\n",$1); insertar_polaca($1); if( tipo_validar != 1) tipo_validar = 2; else tipo_validar= 1;
																		if( !verificarCtesRepetidas($1) ) {lista_constantes[indice_constantes].nombre = copiar($1); ;
																		lista_constantes[indice_constantes].tipo = copiar("Int");
																		lista_constantes[indice_constantes].valor = atoi($1); indice_constantes++; } }
		| CTE_R {printf("R35: factor -> CTE_R(%s)\n",$1); insertar_polaca($1); tipo_validar = 1;  if( !verificarCtesRepetidas($1) ) {lista_constantes[indice_constantes].nombre = copiar($1);
																		lista_constantes[indice_constantes].tipo = copiar("Float");		
																		lista_constantes[indice_constantes].valor_f = atof($1); indice_constantes++;  }}
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
		}
		;
		
bloque_declaracion:
		bloque_declaracion declaracion { printf ( "R38: bloque_declaracion -> bloque_declaracion declaracion\n"); }
		| declaracion { printf("R39: bloque_declaracion -> declaracion\n"); }
		;
		
declaracion:
		multiple_dec DP tipo { int j; for( j = total_tipos; j < indice_variables; j++ ){
											lista_variables[j].tipo = copiar(tipo);
										}
									  total_tipos = indice_variables;
							   printf("R40: declaracion -> multiple_dec : tipo\n"); insertar_polaca($2); }
		;
		
multiple_dec:
		multiple_dec COMA variable { printf("R41: multiple_dec -> multiple_dec , variable\n"); /*insertar_polaca($2);*/ } 
		| variable { printf("R42: multiple_dec -> variable\n"); } 
		;
		
variable:
		ID { lista_variables[indice_variables].nombre = copiar($1); indice_variables++; 
			 printf("R43: variable -> ID\n"); insertar_polaca($1); } 
		;
		
tipo:
		FLOAT {printf ("R44: tipo -> FLOAT\n"); insertar_polaca($1); tipo = copiar($1);} 
		| INT {printf ("R45: tipo -> INT\n"); insertar_polaca($1); tipo = copiar($1);}
		| STRING {printf ("R46: tipo -> STRING\n"); insertar_polaca($1); tipo = copiar($1); }
		;
		
constante_string:
		CTE_S { printf ("R47: constante_string -> CTE_S(%s)\n",$1); insertar_polaca($1); tipo_validar = 3;
																				  lista_constantes[indice_constantes].nombre = copiar($1);
																				  lista_constantes[indice_constantes].tipo = copiar("String");
																				  lista_constantes[indice_constantes].longitud = strlen($1); indice_constantes++;}
		;

read:
		READ PARA CTE_S PARC{ printf("R48: read -> READ (CTE_S)\n"); insertar_polaca($1); insertar_polaca($3);lista_inout[indice_inout].nombre = copiar($3); 
																	 lista_inout[indice_inout].tipo = copiar("String"); indice_inout++;}
		| READ PARA CTE_E PARC{printf("R49: read -> READ (CTE_E)\n"); insertar_polaca($1); insertar_polaca($3);lista_inout[indice_inout].nombre = copiar($3); 
																      lista_inout[indice_inout].tipo = copiar("Int"); indice_inout++;}
		| READ PARA ID PARC {printf("R50: read -> READ (ID)\n"); insertar_polaca($1); insertar_polaca($3);lista_inout[indice_inout].nombre = copiar($3); indice_inout++;}
		| READ PARA CTE_R PARC{printf("R51: read -> READ (CTE_R)\n"); insertar_polaca($1); insertar_polaca($3);lista_inout[indice_inout].nombre = copiar($3); 
																	  lista_inout[indice_inout].tipo = copiar("Float"); indice_inout++;}
		;
write:
		WRITE PARA CTE_S PARC{ printf("R51: write -> WRITE (CTE_S)\n"); insertar_polaca($1); insertar_polaca($3);lista_inout[indice_inout].nombre = copiar($3); 
																        lista_inout[indice_inout].tipo = copiar("String"); indice_inout++; printf("%s\n",lista_inout[indice_inout].nombre);}
		| WRITE PARA CTE_E PARC{printf("R52: write -> WRITE (CTE_E)\n"); insertar_polaca($1); insertar_polaca($3);lista_inout[indice_inout].nombre = copiar($3); 
																	     lista_inout[indice_inout].tipo = copiar("Int"); indice_inout++;}
		| WRITE PARA ID PARC{printf("R53: write -> WRITE (ID)\n"); insertar_polaca($1); insertar_polaca($3); lista_inout[indice_inout].nombre = copiar($3); indice_inout++;}
		| WRITE PARA CTE_R PARC{printf("R54: write -> WRITE (CTE_R)\n"); insertar_polaca($1); insertar_polaca($3); lista_inout[indice_inout].nombre = copiar($3); 
																		 lista_inout[indice_inout].tipo = copiar("Float"); indice_inout++; }
		;
%%


int main(int argc, char *argv[]) {
	crear_pila(&pila_comp);
	crear_pila(&pila_ciclo);
	crear_pila(&pila_fib);
	crear_pila(&pila_sel);
	crear_pila_c(&pila_op);

	
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
	char *buffer = malloc(4);
	sprintf(buffer,"%d",a);

	return buffer;
}

char *copiar( char *dato ) {
	char *buffer_cpy = malloc(10);
	sprintf(buffer_cpy,"%s",dato);
	return buffer_cpy;
}

void crear_pila( tPila *nodo ) {
	*nodo = NULL;
}

void crear_pila_c( tPila_c *nodo ){
	*nodo = NULL;
}

void apilar(int v, tPila *pila) {
   pNodo nuevo;

   nuevo = (pNodo)malloc(sizeof(tipoNodo));
   nuevo->dato = v;
   
   nuevo->siguiente = *pila;
   *pila = nuevo;
}

void apilar_c(char *v, tPila_c *pila) {
   pNodo_c nuevo;

   nuevo = (pNodo_c)malloc(sizeof(tipoNodo_c));
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

char *desapilar_c(tPila_c *pila) {
   pNodo_c nodo; 
   char *v;      

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

void generar_asm()
{
	FILE *archivo;
	int i = 0;
	archivo = fopen("final.asm","w+");
	char *cadena;
	
	fprintf(archivo,"include macros2.asm\n");
	fprintf(archivo,"include number.asm\n\n");
	fprintf(archivo,".MODEL LARGE\n.STACK 200h\nMAXTEXTSIZE equ 50\n.386\n.387\n.DATA\n\n");

	//DECLARACION DE VARIABLES
	for(i = 0; i<indice_variables; i++){
		fprintf(archivo,"\t@%s ",lista_variables[i].nombre);
		if(strcmp(lista_variables[i].tipo,"Int")==0)
			fprintf(archivo,"\tDD 0.0\n");
		else
			if(strcmp(lista_variables[i].tipo,"Float")==0)
				fprintf(archivo,"\tDD 0.0\n");
			else
				if(strcmp(lista_variables[i].tipo,"String")==0)
					fprintf(archivo,"\tDB MAXTEXTSIZE dup (?),'$'\n");
	}

	//DECLARACION DE CONSTANTES
	for(i = 0; i<indice_constantes; i++){
		cadena = copiar(reemplazarMenos(lista_constantes[i].nombre));
		cadena = copiar(reemplazarPunto(lista_constantes[i].nombre));
		cadena = copiar(reemplazarComillas(lista_constantes[i].nombre));
		if(strcmp(lista_constantes[i].tipo,"Int")==0)
			fprintf(archivo,"\t@_%s \tDD %d.0\n",cadena,lista_constantes[i].valor);
		else
			if (strcmp(lista_constantes[i].tipo,"Float")==0)
				fprintf(archivo,"\t@_%s \tDD %.1f\n",cadena,lista_constantes[i].valor_f);
			else
				if(strcmp(lista_constantes[i].tipo,"String")==0)
					fprintf(archivo,"\t@_%s \tDB \"%s\",'$',%d dup(?)\n",cadena,cadena,50-lista_constantes[i].longitud);
	}
	
	
	
	//DECLARACION AUXILIARES
	
	lista_auxiliares[0].nombre = copiar("@aux1");
	lista_auxiliares[1].nombre = copiar("@aux2");
	fprintf(archivo,"\t%s \tDD 0.0\n",lista_auxiliares[0].nombre);
	fprintf(archivo,"\t%s \tDD 0.0\n",lista_auxiliares[1].nombre);
	int aux = 1;
	for( i = 0 ; i < indice ; i++ )
	{
		if( polaca[i] != NULL){
			if(strcmp(polaca[i],"+")==0 )
				aux++;
			if(strcmp(polaca[i],"*")==0 )
				aux++;
			if(strcmp(polaca[i],"/")==0 )
				aux++;
			if(strcmp(polaca[i],"-")==0 )
				aux++;
		}	
	}
	
	for ( i = 1 ; i < aux ; i ++ )
		fprintf(archivo,"\t@exp%d \tDD 0.0\n",i);
	
	
	fprintf(archivo,"\t@null \tDD -1.0\n");
	fprintf(archivo,"\n.CODE\n.startup\n\tSTART:\n\tmov AX,@DATA\n\tmov DS,AX\n\n");
	
	recorrerPolaca(archivo);
		
	//MANEJO DE CADENAS	
	fprintf(archivo,"\n;FIN DEL PROGRAMA DE USUARIO\n\nstrlen proc\n\tmov bx, 0\n\tstrl01:\n\tcmp BYTE PTR [si+bx],'$'\n\tje strend\n\tinc bx\n\tjmp strl01\n\tstrend:\n\tret\nstrlen endp\n");
	fprintf(archivo,"\ncopiar proc\n\tcall strlen\n\tcmp bx , MAXTEXTSIZE\n\tjle copiarSizeOk\n\tmov bx , MAXTEXTSIZE\n\tcopiarSizeOk:\n\tmov cx , bx\n\tcld\n\trep movsb\n\tmov al , '$'\n\tmov byte ptr[di],al\n\tret\ncopiar endp\n");
	fprintf(archivo,"\nconcat proc\n\tpush ds\n\tpush si\n\tcall strlen\n\tmov dx , bx\n\tmov si , di\n\tpush es\n\tpop ds\n\tcall strlen\n\tadd di, bx\n\tadd bx, dx\n\tcmp bx , MAXTEXTSIZE\n\tjg concatSizeMal\n\tconcatSizeOk:\n\tmov cx , dx\n\tjmp concatSigo\n\tconcatSizeMal:\n\tsub bx , MAXTEXTSIZE\n\tsub dx , bx\n\tmov cx , dx\n\tconcatSigo:\n\tpush ds\n\tpop es\n\tpop si\n\tpop ds\n\tcld\n\trep movsb\n\tmov al , '$'\n\tmov byte ptr[di],al\n\tret\nconcat endp\n");
	
	fprintf(archivo,"\tmov ah, 4ch\n\tint 21h\n\nEND START");
	
	fclose(archivo);
	//recorrer lista variables por no usadas
	for( i = 0; i < indice_variables ; i ++ )
	{
		if( lista_variables[i].usada == 0 )
			printf( "\n\n\t WARNING: Variable %s inicializada por nunca utilizada\n",lista_variables[i].nombre);
	}
	
}

void recorrerPolaca(FILE *archivo){
	
	int i;
	char *op1;
	char *op2;
	char *buffer;
	int aux = 0;
	char *cadena;
	char *operando;
	buffer = copiar("@exp");
	strcat(buffer,convertir(aux));
	
	
	for( i = 0 ; i < indice ; i++)
	{
		if( polaca[i] != NULL){
		//OPERADORES	
			
			cadena = copiar(reemplazarMenos(polaca[i]));
			cadena = copiar(reemplazarPunto(polaca[i]));
			cadena = copiar(reemplazarComillas(polaca[i]));
			
			if( esOperando(polaca[i]) == 1 ) {
				operando = copiar("@");
				strcat(operando,polaca[i]);
				
				apilar_c( operando , &pila_op );
			}
			if( esOperando(cadena) == 2 ) {
				operando = copiar("@_");
				
				
				strcat(operando,cadena);
				
				apilar_c( operando , &pila_op );
			}
			
			if( esOperando(polaca[i]) == 3 ) {
				
				apilar_c( polaca[i] , &pila_op );
			}
			if(strcmp(polaca[i],"+")==0 )
			{
				aux++;
				buffer = copiar("@exp");
				strcat(buffer,convertir(aux));
				op1 = copiar(desapilar_c(&pila_op));
				op2 = copiar(desapilar_c(&pila_op));			
				fprintf(archivo,"\tFLD %s\n",op2);
				fprintf(archivo,"\tFLD %s\n",op1);
				fprintf(archivo,"\tFADD\n");
				fprintf(archivo,"\tFST %s\n",buffer); 
				apilar_c( buffer , &pila_op);	
			}
			if(strcmp(polaca[i],"*")==0 )
			{	
				aux++;
				buffer = copiar("@exp");
				strcat(buffer,convertir(aux));
				op1 = copiar(desapilar_c(&pila_op));
				op2 = copiar(desapilar_c(&pila_op));
				fprintf(archivo,"\tFLD %s\n",op2);
				fprintf(archivo,"\tFLD %s\n",op1);
				fprintf(archivo,"\tFMUL\n");
				fprintf(archivo,"\tFST %s\n",buffer); 
				apilar_c( buffer , &pila_op);	
			}
			if(strcmp(polaca[i],"/")==0 )
			{
				aux++;
				buffer = copiar("@exp");
				strcat(buffer,convertir(aux));
				op1 = copiar(desapilar_c(&pila_op));
				op2 = copiar(desapilar_c(&pila_op));
				fprintf(archivo,"\tFLD %s\n",op2);
				fprintf(archivo,"\tFLD %s\n",op1);
				fprintf(archivo,"\tFDIV\n");
				fprintf(archivo,"\tFST %s\n",buffer);
				apilar_c( buffer , &pila_op);	
			}
			if(strcmp(polaca[i],"-")==0 )
			{
				aux++;
				strcpy(buffer,"@exp");
				strcat(buffer,convertir(aux));
				op1 = copiar(desapilar_c(&pila_op));
				op2 = copiar(desapilar_c(&pila_op));
				fprintf(archivo,"\tFLD %s\n",op2);
				fprintf(archivo,"\tFLD %s\n",op1);
				fprintf(archivo,"\tFSUB\n");
				fprintf(archivo,"\tFST %s\n",buffer);
				apilar_c( buffer , &pila_op);
			}
			
			//ASIGNACIONES
			if( strcmp(polaca[i] , "=" )==0 )
			{
				op1 = copiar(desapilar_c(&pila_op));
				op2 = copiar(desapilar_c(&pila_op));
				if( strstr( op2 , "__" ) != NULL )
				{
				fprintf(archivo,"\tmov ax, @DATA\n\tmov ds, ax\n\tmov es, ax\n\tmov si, OFFSET ");
				fprintf(archivo,"%s\n",op2);
				fprintf(archivo,"\tmov di, OFFSET %s\n\tcall copiar\n",op1);
				}
				else
				{
				fprintf(archivo,"\tFLD %s\n",op2);
				fprintf(archivo,"\tFST %s\n",op1);
				}
			}		
			
			//WRITE
			/*if( esEntradaSalida(polaca[i]) == 1 ) 
			{
				
				if(strcmp( obtenerTipo(polaca[i+1] ) , "Int" ) == 0 )
					fprintf(archivo,"\tdisplayFloat \t@%s,3\n\tnewLine 1\n", polaca[i+1]);
				else 
					if(strcmp( obtenerTipo(polaca[i+1] )  , "Float" ) == 0)
						fprintf(archivo,"\tdisplayFloat \t@%s,3\n\tnewLine 1\n", polaca[i+1]);
					else
						if(strcmp( obtenerTipo(polaca[i+1] )  , "String" ) == 0)
							fprintf(archivo,"\tdisplayString \t@%s\n\tnewLine 1\n", polaca[i+1]);
			}*/
			
		}
		
	}	
}

int esOperando(char *dato)
{
	int i ;
	

	for( i = 0 ; i < indice_id ; i ++ )
	{
			if( strcmp( dato , lista_id[i].nombre) == 0){ 
			return 1;}
	}
	
	for( i = 0 ; i < indice_variables ; i ++ )
	{
			if( strcmp( dato , lista_variables[i].nombre) == 0){ 
			return 1;}
	}
	
	for( i = 0 ; i < indice_constantes ; i ++ )
	{
			if( strcmp( dato , lista_constantes[i].nombre) == 0){ 
			return 2;}
	}
	
	for( i = 0 ; i < 2 ; i ++ )
	{
			if( strcmp( dato , lista_auxiliares[i].nombre) == 0){ 
			return 3;}
	}
	
	return 0;
}

int verficarDeclaracion(char *dato)
{
	int i ;
	

	for( i = 0 ; i < indice_variables ; i ++ )
	{
			if( strcmp( dato , lista_variables[i].nombre) == 0){ 
			return 1;}
	}	
	
	return 0;
}

int verificarCtesRepetidas(char *dato)
{
	int i ;
	
	for( i = 0 ; i < indice_constantes ; i ++ )
	{
			if( strcmp( dato , lista_constantes[i].nombre) == 0){ 
			return 1;}
	}	
	
	return 0;
}

int verificarTipo(int tipo, char *variable)
{
	int i ;
	char *tipo_c;
	printf( "%d", tipo );
	if( tipo == 1 )
		tipo_c = copiar( "Float" );
	if( tipo == 2 )
		tipo_c = copiar("Int");
	if( tipo == 3 )
		tipo_c = copiar("String");
	printf("%s",tipo_c);
	for( i = 0 ; i < indice_variables ; i ++ )
	{
			if( strcmp( variable , lista_variables[i].nombre) == 0){ 
				if( strcmp( tipo_c , lista_variables[i].tipo) == 0){
					return 1;
				}
			}
	}	
	
	return 0;
}

int esEntradaSalida(char *dato)
{
	if( strcmp( dato , "write") == 0)
		return 1;
	if( strcmp( dato , "read") == 0 )
		return 2;
	return 0;
}

char *obtenerTipo( char *dato )
{
	int i = 0;
	for( i = 0 ; i < indice_inout ; i ++ )
	{
		if( strcmp( dato , lista_inout[indice_inout].nombre ) == 0 ){ 
		return lista_inout[indice_inout].tipo ;}
	}		
	return 0;
}

char *reemplazarMenos(char *dato){
	int i ;
	for (i=0;i<=strlen(dato)-1;i++){ 
		if (dato[i]=='-'){
			dato[i]='m'; 
		} 
    } 
	
	return dato;
}
char *reemplazarPunto(char *dato){
	int i ;
	
	for (i=0;i<=strlen(dato)-1;i++){ 
		if (dato[i]=='.'){
			dato[i]='p'; 
		} 
    } 
	return dato;
}	
	
char *reemplazarComillas(char *dato)
{
	int i ;
	
	for (i=0;i<=strlen(dato)-1;i++){ 
		if (dato[i]=='"'){
			dato[i]='_'; 
		} 
    } 
	return dato;
}

int marcarVariable( char *dato)
{
	int i;
	for( i = 0 ; i < indice_variables ; i ++ )
	{
		if( strcmp( lista_variables[i].nombre , dato ) == 0 )
			lista_variables[i].usada = 1;
	}
}


