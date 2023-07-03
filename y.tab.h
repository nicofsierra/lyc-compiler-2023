/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CTE_E = 258,
     CTE_R = 259,
     ID = 260,
     OP_ASIG = 261,
     OP_SUM = 262,
     OP_MUL = 263,
     OP_RES = 264,
     OP_DIV = 265,
     LA = 266,
     LC = 267,
     PARA = 268,
     PARC = 269,
     CORA = 270,
     CORC = 271,
     AND = 272,
     OR = 273,
     CO_IGUAL = 274,
     CO_DIST = 275,
     CO_MENI = 276,
     CO_MEN = 277,
     CO_MAYI = 278,
     CO_MAY = 279,
     IF = 280,
     ELSE = 281,
     CICLO = 282,
     CTE_S = 283,
     DP = 284,
     PC = 285,
     COMA = 286,
     PUNTO = 287,
     INIT = 288,
     INT = 289,
     FLOAT = 290,
     STRING = 291,
     READ = 292,
     WRITE = 293,
     NOT = 294,
     FIB = 295
   };
#endif
/* Tokens.  */
#define CTE_E 258
#define CTE_R 259
#define ID 260
#define OP_ASIG 261
#define OP_SUM 262
#define OP_MUL 263
#define OP_RES 264
#define OP_DIV 265
#define LA 266
#define LC 267
#define PARA 268
#define PARC 269
#define CORA 270
#define CORC 271
#define AND 272
#define OR 273
#define CO_IGUAL 274
#define CO_DIST 275
#define CO_MENI 276
#define CO_MEN 277
#define CO_MAYI 278
#define CO_MAY 279
#define IF 280
#define ELSE 281
#define CICLO 282
#define CTE_S 283
#define DP 284
#define PC 285
#define COMA 286
#define PUNTO 287
#define INIT 288
#define INT 289
#define FLOAT 290
#define STRING 291
#define READ 292
#define WRITE 293
#define NOT 294
#define FIB 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 49 "Sintactico.y"
{
 char *cadena;
}
/* Line 1529 of yacc.c.  */
#line 133 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

