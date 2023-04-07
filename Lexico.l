%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
DO				"DO"
CASE			"CASE"	
DEFAULT			"DEFAULT"
ENDDO			"ENDDO"
REPEAT			"REPEAT"
INIT			"init"
ID				{LETRA}({LETRA}|{DIGITO}|_)*

%%

{CORA}          {printf("\nCorAbre: %s", yytext);}
{CORC}			{printf("\nCorCierra: %s", yytext);}

{INT}			{printf("\nP_Reservada_INT: %s", yytext);}											
{FLOAT}			{printf("\nP_Reservada_FLOAT: %s", yytext);}
{STRING}		{printf("\nP_Reservada_STRING: %s", yytext);}
{IF}			{printf("\nP_Reservada_IF: %s", yytext);}
{ELSE}			{printf("\nP_Reservada_ELSE: %s", yytext);}
{CICLO}			{printf("\nP_Reservada_WHILE: %s", yytext);}
{READ}			{printf("\nP_Reservada_READ: %s", yytext);}
{WRITE}			{printf("\nP_Reservada_WRITE: %s", yytext);}
{DO}			{printf("\nP_Reservada_DO: %s", yytext);}
{CASE}			{printf("\nP_Reservada_CASE: %s", yytext);}
{DEFAULT}		{printf("\nP_Reservada_DEFAULT: %s", yytext);}
{ENDDO}			{printf("\nP_Reservada_ENDDO: %s", yytext);}
{REPEAT}		{printf("\nP_Reservada_REPEAT: %s", yytext);}
{INIT}			{printf("\nP_Reservada_INIT: %s", yytext);}


{CTE_E}			{printf("\nConstEntera: %s", yytext);} 
{CTE_R}			{printf("\nConstReal: %s", yytext);}

{CTE_S} 		{printf("\nConstString: %s", yytext);}  
{COMENTARIO}
{DP}			{printf("\nDosPuntos: %s", yytext);}
{PC}			{printf("\nPuntoComa: %s", yytext);}
{OP_SUM}		{printf("\nSuma: %s", yytext);}
{OP_ASIG}		{printf("\nAsignacion: %s", yytext);}
{OP_MUL}		{printf("\nMultiplicacion: %s", yytext);}
{OP_RES}		{printf("\nResta: %s", yytext);}
{OP_DIV}		{printf("\nDivision: %s", yytext);}
{COMA}			{printf("\nComa: %s", yytext);}
{LA}            {printf("\nLlAbre: %s", yytext);}
{LC}			{printf("\nLlCierra: %s", yytext);}
{PARA}			{printf("\nParAbre: %s", yytext);}
{PARC}			{printf("\nParCierra: %s", yytext);}
{PUNTO}			{printf("\nPunto: %s", yytext);}
{AND}			{printf("\nAnd: %s", yytext);}
{OR}			{printf("\nOr: %s", yytext);}
{NOT}			{printf("\nNOT: %s", yytext);}
{CO_IGUAL}		{printf("\nIgual: %s", yytext);}
{CO_DIST}		{printf("\nNoIgual: %s", yytext);}
{CO_MENI}		{printf("\nMenIgual: %s", yytext);}
{CO_MEN}		{printf("\nMenor: %s", yytext);}
{CO_MAYI}		{printf("\nMayIgual: %s", yytext);}
{CO_MAY}		{printf("\nMayor: %s", yytext);}

{ID}			{printf("\nIdentificador: %s", yytext);}



"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
"@"			 { printf( "\nERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}
.			 { printf( "\nERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}



%%


int main(int argc,char *argv[])
{
	
	if ((yyin = fopen(argv[1], "r")) == NULL)
	{
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
	}
	else
	{
		yylex();
	}
	
	fclose(yyin);

}

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
	if( cadena > 40 ){
		printf( "\nERROR LEXICO : Longitud String Invalido ( 40 caracteres ): %s\n", yytext ); exit (0);}
	return 0;
}