%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

struct struct_tablaSimbolos{
	char nombre[100];
	char tipo[100];
	char valor[50];
	int longitud;
};

int guardar_TS(char*, char*, char*);
int crear_TS();
int contarChar( char* a );
int puntero_array = 0;

char* str_cpy(char* destino, const char* origen);
int str_cmp(const char * str1, const char * str2);

struct struct_tablaSimbolos tablaSimbolos[1000];

FILE  *yyin;
//int yylval;
char *yyltext;

int yyerror(void);
int eval_int( char *n );
int eval_float( char *n );
int eval_string( char *s );


%}

%option noyywrap  
%option yylineno 

CORA			"["
CORC			"]"

DIGITO			[0-9]
LETRA			[a-zA-Z]
SIMBOLO			[:>!]
A_COMENTARIO	"*-"
C_COMENTARIO	"-*"

CTE_E	        ("-")*{DIGITO}+
CTE_R			("-")*{DIGITO}*"."{DIGITO}*
CTE_S 			"\""({LETRA}|{DIGITO}|{SIMBOLO}|.)+"\""
COMENTARIO		{A_COMENTARIO}({LETRA}|{DIGITO}|.)+{C_COMENTARIO}
DP				":"
PC				";"
OP_ASIG   		"="
OP_SUM		    "+"
OP_MUL          "*"
OP_RES		    "-"
OP_DIV          "/"
COMA			","
LA              "{"
LC				"}"
PARA			"("
PARC			")"
PUNTO			"."
AND 			"&"
OR				"||"
NOT				"not"
CO_IGUAL		"=="
CO_DIST			"!="
CO_MENI			"<="
CO_MEN			"<"
CO_MAYI			">="
CO_MAY			">"
INT				"Int"
FLOAT			"Float"
STRING			"String"
IF				"if"
ELSE			"else"
CICLO			"ciclo"
READ			"read"
WRITE			"write"
INIT			"init"
FIB				"FIB"
ID				{LETRA}({LETRA}|{DIGITO}|_)*

%%

{CORA}          {yylval.cadena = strdup(yytext); return CORA; }
{CORC}			{yylval.cadena = strdup(yytext); return CORC; }

{INT}			{yylval.cadena = strdup(yytext); return INT; }											
{FLOAT}			{yylval.cadena = strdup(yytext); return FLOAT; }
{STRING}		{yylval.cadena = strdup(yytext); return STRING; }
{IF}			{yylval.cadena = strdup(yytext); return IF; }
{ELSE}			{yylval.cadena = strdup(yytext); return ELSE; }
{CICLO}			{yylval.cadena = strdup(yytext); return CICLO; }
{READ}			{yylval.cadena = strdup(yytext); return READ; }
{WRITE}			{yylval.cadena = strdup(yytext); return WRITE; }
{INIT}			{yylval.cadena = strdup(yytext); return INIT; }
{FIB}			{yylval.cadena = strdup(yytext); return FIB; }

{CTE_E}			{yylval.cadena = strdup(yytext); guardar_TS("CTE_E", yytext, yytext); eval_int(yytext); return CTE_E; } 
{CTE_R}			{yylval.cadena = strdup(yytext); guardar_TS("CTE_R", yytext, yytext); eval_float(yytext); return CTE_R; }

{CTE_S} 		{yylval.cadena = strdup(yytext); guardar_TS("CTE_S", yytext, yytext); eval_string(yytext); return CTE_S; }  
{COMENTARIO}
{DP}			{yylval.cadena = strdup(yytext); return DP; }
{PC}			{yylval.cadena = strdup(yytext); return PC; }
{OP_SUM}		{yylval.cadena = strdup(yytext); return OP_SUM; }
{OP_ASIG}		{yylval.cadena = strdup(yytext); return OP_ASIG; }
{OP_MUL}		{yylval.cadena = strdup(yytext); return OP_MUL; }
{OP_RES}		{yylval.cadena = strdup(yytext); return OP_RES; }
{OP_DIV}		{yylval.cadena = strdup(yytext); return OP_DIV; }
{COMA}			{yylval.cadena = strdup(yytext); return COMA; }
{LA}            {yylval.cadena = strdup(yytext); return LA; }
{LC}			{yylval.cadena = strdup(yytext); return LC; }
{PARA}			{yylval.cadena = strdup(yytext); return PARA; }
{PARC}			{yylval.cadena = strdup(yytext); return PARC; }
{PUNTO}			{yylval.cadena = strdup(yytext); return PUNTO; }
{AND}			{yylval.cadena = strdup(yytext); return AND; }
{OR}			{yylval.cadena = strdup(yytext); return OR; }
{NOT}			{yylval.cadena = strdup(yytext); return NOT; }
{CO_IGUAL}		{yylval.cadena = strdup(yytext); return CO_IGUAL; }
{CO_DIST}		{yylval.cadena = strdup(yytext); return CO_DIST; }
{CO_MENI}		{yylval.cadena = strdup(yytext); return CO_MENI; }
{CO_MEN}		{yylval.cadena = strdup(yytext); return CO_MEN; }
{CO_MAYI}		{yylval.cadena = strdup(yytext); return CO_MAYI;}
{CO_MAY}		{yylval.cadena = strdup(yytext); return CO_MAY; }

{ID}			{yylval.cadena = strdup(yytext); guardar_TS("ID", yytext, ""); return ID; }



"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
"@"			 { printf( "\nERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0); return 0; }
.			 { printf( "\nERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0); return 0; }


%%


int eval_int( char* n ){
	int entero = atoi(n);
	if( entero  < -65535 || entero > 65535 ){
		printf( "\nERROR LEXICO : Rango entero Invalido (16 bits): %s\n", yytext ); 
		exit (0);
	}
	return 0;
}
int eval_float( char* n ){
	char *ptr;
	long ret;
	ret = strtol(n, &ptr,10);	
	long cota_i = 2147483648*(-1);
	long cota_s = 2147483647;
	if( ret  <= cota_i || ret >= cota_s ){
		printf( "\nERROR LEXICO : Rango reales Invalido (32 bits): %s\n", yytext ); 
		exit (0);
	} 
	return 0;
}

int eval_string( char* s ){
	int cadena = strlen(s);
	if( cadena > 30 ){
		printf( "\nERROR LEXICO : Longitud String Invalido ( 30 caracteres ): %s\n", yytext ); exit (0); }
	return 0;
}

int guardar_TS (char* tipo, char* nombre, char* valor) {
	int i;
	int retornar;
	char *buffer;

	for(i = 0; i < puntero_array; i++) {
		if(str_cmp(tablaSimbolos[i].nombre, nombre) == 0){
			return i;
		}
	}

	str_cpy(tablaSimbolos[puntero_array].nombre, nombre);
	str_cpy(tablaSimbolos[puntero_array].tipo, tipo);
	str_cpy(tablaSimbolos[puntero_array].valor, valor);

	if(tipo == "CTE_S") {
		int longitud = strlen(nombre);
		tablaSimbolos[puntero_array].longitud = longitud;
	}

	retornar = puntero_array;
	puntero_array++;

	return retornar;
}

int crear_TS() {
	FILE *pf; 
	int i;
	pf = fopen("ts.txt","w+"); 

	if (!pf){
		return 0;
	}

	fprintf(pf, "%-32s|\t%-15s|\t%-32s|\t%-13s\n\n", "Nombre","Tipo","Valor","Longitud");
	for (i = 0; i < puntero_array; i++){
		if (str_cmp(tablaSimbolos[i].tipo, "CTE_E") == 0 || str_cmp(tablaSimbolos[i].tipo, "CTE_R") == 0 || str_cmp(tablaSimbolos[i].tipo, "CTE_S") == 0){  
			fprintf(pf, "%-32s|\t%-15s|\t%-32s|\t%-13d\n\n", tablaSimbolos[i].nombre, tablaSimbolos[i].tipo, tablaSimbolos[i].valor, tablaSimbolos[i].longitud);
		} else { 
			fprintf(pf, "_%-32s|\t%-15s|\t%-32s|\t%-13d\n\n", tablaSimbolos[i].nombre, tablaSimbolos[i].tipo, tablaSimbolos[i].valor, tablaSimbolos[i].longitud);
		}
	}
	fclose(pf); 
	
	return 1;
}

char* str_cpy(char* destino, const char* origen) {
    if (destino == NULL) {
        return NULL;
    }
    
    char *ptr = destino;
    
    while (*origen != '\0') {
        *destino = *origen;
        destino++;
        origen++;
    }
    
    *destino = '\0';
    
    return ptr;
}

int str_cmp(const char * str1, const char * str2) {
	while (*str1 == *str2) {
		if (*str1 == '\0' || *str2 == '\0')
			break;
		str1++;
		str2++;
	}

	if (*str1 == '\0' && *str2 == '\0')
      return 0;
   	else
      return -1;
}

int contarChar( char* a ) {
	int i, cont = 0;

	for(i = 0 ; i < 32 ; i++) {	
		if( a[i] != '\n' ) {
			cont++;
		}
	}

	return cont;
}