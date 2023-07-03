/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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




/* Copy the first part of user declarations.  */
#line 1 "Sintactico.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
//#include "ts.h"

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

//polaca
char *polaca[100];
int indice = 0;
void insertar_polaca();
void exportar();
void escribir_polaca(char *,int );
char comp[4] = {'0','0','0','\n'} ;
char notcomp[4] = {'0','0','0','\n'} ;

//manejo de cadenas
char *convertir( int );



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 49 "Sintactico.y"
{
 char *cadena;
}
/* Line 193 of yacc.c.  */
#line 227 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 240 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  22
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   128

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  31
/* YYNRULES -- Number of rules.  */
#define YYNRULES  65
/* YYNRULES -- Number of states.  */
#define YYNSTATES  118

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   295

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    26,    30,    31,    38,    42,    43,    49,    54,
      55,    64,    65,    70,    71,    76,    78,    79,    84,    85,
      91,    93,    95,    97,    99,   101,   103,   107,   111,   113,
     117,   121,   123,   127,   129,   131,   133,   138,   143,   146,
     148,   152,   156,   158,   160,   162,   164,   166,   168,   173,
     178,   183,   188,   193,   198,   203
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      42,     0,    -1,    43,    -1,    44,    -1,    43,    44,    -1,
      45,    -1,    51,    -1,    46,    -1,    63,    -1,    70,    -1,
      71,    -1,     5,     6,    60,    -1,     5,     6,    69,    -1,
      -1,    25,    13,    53,    14,    47,    48,    -1,    11,    43,
      12,    -1,    -1,    11,    43,    12,    49,    50,    -1,    26,
      11,    43,    12,    -1,    -1,    27,    52,    13,    53,    14,
      11,    43,    12,    -1,    -1,    56,    54,    17,    56,    -1,
      -1,    56,    55,    18,    56,    -1,    56,    -1,    -1,    60,
      57,    59,    60,    -1,    -1,    39,    60,    58,    59,    60,
      -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,
      -1,    24,    -1,    60,     7,    61,    -1,    60,     9,    61,
      -1,    61,    -1,    61,     8,    62,    -1,    61,    10,    62,
      -1,    62,    -1,    13,    60,    14,    -1,     5,    -1,     3,
      -1,     4,    -1,    40,    13,     3,    14,    -1,    33,    11,
      64,    12,    -1,    64,    65,    -1,    65,    -1,    66,    29,
      68,    -1,    66,    31,    67,    -1,    67,    -1,     5,    -1,
      35,    -1,    34,    -1,    36,    -1,    28,    -1,    37,    13,
      28,    14,    -1,    37,    13,     3,    14,    -1,    37,    13,
       5,    14,    -1,    37,    13,     4,    14,    -1,    38,    13,
      28,    14,    -1,    38,    13,     3,    14,    -1,    38,    13,
       5,    14,    -1,    38,    13,     4,    14,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    95,    95,    98,    99,   103,   104,   105,   106,   107,
     108,   112,   117,   125,   125,   129,   130,   130,   134,   138,
     138,   143,   143,   146,   146,   149,   154,   154,   156,   156,
     161,   162,   163,   164,   165,   166,   170,   171,   172,   176,
     177,   178,   182,   183,   184,   185,   186,   203,   210,   211,
     215,   219,   220,   224,   228,   229,   230,   234,   238,   239,
     240,   241,   244,   245,   246,   247
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CTE_E", "CTE_R", "ID", "OP_ASIG",
  "OP_SUM", "OP_MUL", "OP_RES", "OP_DIV", "LA", "LC", "PARA", "PARC",
  "CORA", "CORC", "AND", "OR", "CO_IGUAL", "CO_DIST", "CO_MENI", "CO_MEN",
  "CO_MAYI", "CO_MAY", "IF", "ELSE", "CICLO", "CTE_S", "DP", "PC", "COMA",
  "PUNTO", "INIT", "INT", "FLOAT", "STRING", "READ", "WRITE", "NOT", "FIB",
  "$accept", "start", "programa", "sentencia", "asignacion", "seleccion",
  "@1", "bloque_seleccion", "@2", "bloque_else", "iteracion", "@3",
  "condicion", "@4", "@5", "comparacion", "@6", "@7", "comparador",
  "expresion", "termino", "factor", "zonadec", "bloque_declaracion",
  "declaracion", "multiple_dec", "variable", "tipo", "constante_string",
  "read", "write", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    44,
      44,    45,    45,    47,    46,    48,    49,    48,    50,    52,
      51,    54,    53,    55,    53,    53,    57,    56,    58,    56,
      59,    59,    59,    59,    59,    59,    60,    60,    60,    61,
      61,    61,    62,    62,    62,    62,    62,    63,    64,    64,
      65,    66,    66,    67,    68,    68,    68,    69,    70,    70,
      70,    70,    71,    71,    71,    71
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     3,     3,     0,     6,     3,     0,     5,     4,     0,
       8,     0,     4,     0,     4,     1,     0,     4,     0,     5,
       1,     1,     1,     1,     1,     1,     3,     3,     1,     3,
       3,     1,     3,     1,     1,     1,     4,     4,     2,     1,
       3,     3,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     4,     4,     4,     4,     4
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,    19,     0,     0,     0,     0,     2,     3,
       5,     7,     6,     8,     9,    10,     0,     0,     0,     0,
       0,     0,     1,     4,    44,    45,    43,     0,    57,     0,
      11,    38,    41,    12,     0,     0,    21,    26,     0,    53,
       0,    49,     0,    52,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,    13,
       0,     0,     0,     0,    47,    48,     0,     0,    59,    61,
      60,    58,    63,    65,    64,    62,    42,     0,    36,    37,
      39,    40,     0,     0,     0,     0,    30,    31,    32,    33,
      34,    35,     0,     0,    55,    54,    56,    50,    51,    46,
       0,     0,    14,    22,    24,    27,     0,    29,     0,     0,
      15,    20,     0,     0,    17,     0,     0,    18
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     7,     8,     9,    10,    11,    83,   102,   112,   114,
      12,    18,    35,    60,    61,    36,    62,    82,    92,    37,
      31,    32,    13,    40,    41,    42,    43,    97,    33,    14,
      15
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -84
static const yytype_int8 yypact[] =
{
      42,    -4,    25,   -84,    24,    28,    52,    73,    42,   -84,
     -84,   -84,   -84,   -84,   -84,   -84,     0,     3,    61,    85,
       6,    67,   -84,   -84,   -84,   -84,   -84,    17,   -84,    78,
      18,    45,   -84,   -84,    17,    38,    46,    18,     3,   -84,
      39,   -84,    37,   -84,    79,    80,    82,    84,    95,    96,
      97,    98,    22,    89,    17,    17,    17,    17,    18,   -84,
      99,    81,    83,   100,   -84,   -84,    47,    85,   -84,   -84,
     -84,   -84,   -84,   -84,   -84,   -84,   -84,   101,    45,    45,
     -84,   -84,    83,    86,     3,     3,   -84,   -84,   -84,   -84,
     -84,   -84,    17,   102,   -84,   -84,   -84,   -84,   -84,   -84,
      17,    42,   -84,   -84,   -84,    18,    42,    18,    12,    21,
      91,   -84,    92,   108,   -84,    42,    51,   -84
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -84,   -84,   -83,    -8,   -84,   -84,   -84,   -84,   -84,   -84,
     -84,   -84,    87,   -84,   -84,   -70,   -84,   -84,    40,   -15,
       7,    30,   -84,   -84,    88,   -84,    53,   -84,   -84,   -84,
     -84
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -26
static const yytype_int8 yytable[] =
{
      23,    30,    16,    24,    25,    26,    24,    25,    26,    44,
      45,    46,    52,    27,   103,   104,    27,     1,   108,    58,
      24,    25,    26,   109,   110,    54,     1,    55,    28,    54,
      27,    55,   116,   111,    47,    19,    76,     2,    17,     3,
      29,    20,    34,    29,    39,     4,     2,     1,     3,     5,
       6,    64,    59,    56,     4,    57,     1,    29,     5,     6,
     -25,    78,    79,   117,   -23,    21,    66,     2,    67,     3,
      48,    49,    50,    22,    38,     4,     2,   105,     3,     5,
       6,    94,    95,    96,     4,   107,    80,    81,     5,     6,
      39,    53,    77,    68,    69,    51,    70,   101,    71,    85,
      23,    23,    86,    87,    88,    89,    90,    91,    23,    72,
      73,    74,    75,   106,    93,    99,    84,   -16,   113,   115,
      98,     0,   100,     0,     0,    63,     0,     0,    65
};

static const yytype_int8 yycheck[] =
{
       8,    16,     6,     3,     4,     5,     3,     4,     5,     3,
       4,     5,    27,    13,    84,    85,    13,     5,   101,    34,
       3,     4,     5,   106,    12,     7,     5,     9,    28,     7,
      13,     9,   115,    12,    28,    11,    14,    25,    13,    27,
      40,    13,    39,    40,     5,    33,    25,     5,    27,    37,
      38,    12,    14,     8,    33,    10,     5,    40,    37,    38,
      14,    54,    55,    12,    18,    13,    29,    25,    31,    27,
       3,     4,     5,     0,    13,    33,    25,    92,    27,    37,
      38,    34,    35,    36,    33,   100,    56,    57,    37,    38,
       5,    13,     3,    14,    14,    28,    14,    11,    14,    18,
     108,   109,    19,    20,    21,    22,    23,    24,   116,    14,
      14,    14,    14,    11,    14,    14,    17,    26,    26,    11,
      67,    -1,    82,    -1,    -1,    38,    -1,    -1,    40
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     5,    25,    27,    33,    37,    38,    42,    43,    44,
      45,    46,    51,    63,    70,    71,     6,    13,    52,    11,
      13,    13,     0,    44,     3,     4,     5,    13,    28,    40,
      60,    61,    62,    69,    39,    53,    56,    60,    13,     5,
      64,    65,    66,    67,     3,     4,     5,    28,     3,     4,
       5,    28,    60,    13,     7,     9,     8,    10,    60,    14,
      54,    55,    57,    53,    12,    65,    29,    31,    14,    14,
      14,    14,    14,    14,    14,    14,    14,     3,    61,    61,
      62,    62,    58,    47,    17,    18,    19,    20,    21,    22,
      23,    24,    59,    14,    34,    35,    36,    68,    67,    14,
      59,    11,    48,    56,    56,    60,    11,    60,    43,    43,
      12,    12,    49,    26,    50,    11,    43,    12
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 95 "Sintactico.y"
    {printf("Fin del Programa\n"); exportar();}
    break;

  case 3:
#line 98 "Sintactico.y"
    {printf("R1: programa -> sentencia \n"); }
    break;

  case 4:
#line 99 "Sintactico.y"
    {printf( "R2: programa -> programa sentencia \n");}
    break;

  case 5:
#line 103 "Sintactico.y"
    { printf("R3: sentencia -> asignacion ");}
    break;

  case 6:
#line 104 "Sintactico.y"
    { printf("R4: sentencia -> iteracion \n"); }
    break;

  case 7:
#line 105 "Sintactico.y"
    { printf("R5: sentencia -> seleccion \n"); }
    break;

  case 8:
#line 106 "Sintactico.y"
    { printf("R6: sentencia -> zonadec \n"); }
    break;

  case 9:
#line 107 "Sintactico.y"
    { printf("R7: sentencia -> read \n"); }
    break;

  case 10:
#line 108 "Sintactico.y"
    { printf("R8: sentencia -> write \n"); }
    break;

  case 11:
#line 112 "Sintactico.y"
    { 
			printf("R9: asignacion -> ID = expresion \n"); 
			insertar_polaca((yyvsp[(1) - (3)].cadena));
			insertar_polaca((yyvsp[(2) - (3)].cadena));
		}
    break;

  case 12:
#line 117 "Sintactico.y"
    {
			printf("R10: asignacion -> ID = cte_s \n"); 
			insertar_polaca((yyvsp[(1) - (3)].cadena));
			insertar_polaca((yyvsp[(2) - (3)].cadena));
		}
    break;

  case 13:
#line 125 "Sintactico.y"
    { apilar(indice,&pila_sel);}
    break;

  case 14:
#line 125 "Sintactico.y"
    {printf("R10: seleccion -> IF ( condicion )\n"); escribir_polaca( convertir(indice), desapilar(&pila_sel)); }
    break;

  case 15:
#line 129 "Sintactico.y"
    {printf("R11: bloque_seleccion -> {programa} \n"); escribir_polaca( convertir(indice), desapilar(&pila_comp));escribir_polaca(convertir(indice), desapilar(&pila_sel));}
    break;

  case 16:
#line 130 "Sintactico.y"
    {escribir_polaca( convertir(indice), desapilar(&pila_sel));insertar_polaca("BI");apilar(indice,&pila_sel);indice++;escribir_polaca( convertir(indice), desapilar(&pila_comp));}
    break;

  case 17:
#line 130 "Sintactico.y"
    {escribir_polaca(convertir(indice), desapilar(&pila_sel));printf("R12: bloque_seleccion -> {Programa} ELSE {Programa} bloque_else\n"); }
    break;

  case 18:
#line 134 "Sintactico.y"
    {printf("\nR13: bloque_else -> ELSE {Programa}\n"); }
    break;

  case 19:
#line 138 "Sintactico.y"
    {apilar(indice,&pila_ciclo); insertar_polaca("ET");   }
    break;

  case 20:
#line 138 "Sintactico.y"
    {printf("R14: iteracion -> CICLO (Condicion) { programa }\n"); 
		insertar_polaca("BI"); insertar_polaca(convertir(desapilar(&pila_ciclo))); while(pila_comp!=NULL){ escribir_polaca( convertir(indice), desapilar(&pila_comp)); } }
    break;

  case 21:
#line 143 "Sintactico.y"
    {insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); insertar_polaca(comp); apilar(indice,&pila_comp); indice++;}
    break;

  case 22:
#line 144 "Sintactico.y"
    {printf("R15: condicion -> comparacion AND comparacion n"); insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); 
																					  insertar_polaca(comp); apilar(indice,&pila_comp); indice++;}
    break;

  case 23:
#line 146 "Sintactico.y"
    {insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); insertar_polaca(comp); insertar_polaca(convertir(indice+1));}
    break;

  case 24:
#line 147 "Sintactico.y"
    {printf("R16: condicion -> comparacion OR comparacion\n"); insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP"); 
																					  insertar_polaca(comp); apilar(indice,&pila_comp); indice++; }
    break;

  case 25:
#line 149 "Sintactico.y"
    {printf("R17: condicion -> comparacion\n"); insertar_polaca("@aux1"); insertar_polaca("@aux2"); insertar_polaca("CMP");
																  insertar_polaca(comp); apilar(indice,&pila_comp); indice++; }
    break;

  case 26:
#line 154 "Sintactico.y"
    { insertar_polaca("@aux1"); insertar_polaca("="); }
    break;

  case 27:
#line 154 "Sintactico.y"
    {printf("R18: comparacion -> expresion comparador expresion\n"); 
																						 insertar_polaca("@aux2"); insertar_polaca("="); }
    break;

  case 28:
#line 156 "Sintactico.y"
    { insertar_polaca("@aux1"); insertar_polaca("="); }
    break;

  case 29:
#line 156 "Sintactico.y"
    {printf("\nR19: comparacion -> NOT expresion comparador expresion\n");
																						 insertar_polaca("@aux2"); insertar_polaca("="); }
    break;

  case 30:
#line 161 "Sintactico.y"
    {printf("R20: comparador -> ==\n"); sprintf(comp,"%s","BNE"); sprintf(notcomp,"%s","BEQ");}
    break;

  case 31:
#line 162 "Sintactico.y"
    {printf("R21: comparador -> !=\n"); sprintf(comp,"%s","BEQ"); sprintf(notcomp,"%s","BNE");}
    break;

  case 32:
#line 163 "Sintactico.y"
    {printf("R22: comparador -> <=\n"); sprintf(comp,"%s","BGT"); sprintf(notcomp,"%s","BGE");}
    break;

  case 33:
#line 164 "Sintactico.y"
    {printf("R23: comparador -> <\n"); sprintf(comp,"%s","BGE"); sprintf(notcomp,"%s","BGT");}
    break;

  case 34:
#line 165 "Sintactico.y"
    {printf("R24: comparador -> >=\n"); sprintf(comp,"%s","BLT"); sprintf(notcomp,"%s","BLE");}
    break;

  case 35:
#line 166 "Sintactico.y"
    {printf("R25: comparador -> >\n"); sprintf(comp,"%s","BLE"); sprintf(notcomp,"%s","BLT");}
    break;

  case 36:
#line 170 "Sintactico.y"
    { printf("R26: expresion -> expresion + termino\n"); insertar_polaca((yyvsp[(2) - (3)].cadena));}
    break;

  case 37:
#line 171 "Sintactico.y"
    {printf("R27: expresion -> expresion - termino\n"); insertar_polaca((yyvsp[(2) - (3)].cadena));}
    break;

  case 38:
#line 172 "Sintactico.y"
    {printf("R28: expresion -> termino es expresion\n"); }
    break;

  case 39:
#line 176 "Sintactico.y"
    {printf("R29: termino -> termino * factor\n"); insertar_polaca((yyvsp[(2) - (3)].cadena));}
    break;

  case 40:
#line 177 "Sintactico.y"
    {printf("R30: termino -> termino / factor\n"); insertar_polaca((yyvsp[(2) - (3)].cadena));}
    break;

  case 41:
#line 178 "Sintactico.y"
    {printf("R31: termino -> factor es termino\n"); }
    break;

  case 42:
#line 182 "Sintactico.y"
    {printf("R32: factor -> ( expresion )\n"); }
    break;

  case 43:
#line 183 "Sintactico.y"
    {printf("R33: factor -> ID\n"); insertar_polaca((yyvsp[(1) - (1)].cadena)); }
    break;

  case 44:
#line 184 "Sintactico.y"
    {printf("R34: factor -> CTE_E\n"); insertar_polaca((yyvsp[(1) - (1)].cadena));}
    break;

  case 45:
#line 185 "Sintactico.y"
    {printf("R35: factor -> CTE_R\n"); insertar_polaca((yyvsp[(1) - (1)].cadena)); }
    break;

  case 46:
#line 186 "Sintactico.y"
    { printf("R36: factor -> FIB ( CTE_E )\n"); insertar_polaca("0"); insertar_polaca("@cont"); insertar_polaca("=");
																insertar_polaca("0"); insertar_polaca("@ret"); insertar_polaca("=");
																insertar_polaca("0"); insertar_polaca("@term1"); insertar_polaca("=");
																insertar_polaca("1"); insertar_polaca("@term2"); insertar_polaca("=");
																apilar(indice,&pila_fib); insertar_polaca("ET"); insertar_polaca("@cont"); insertar_polaca((yyvsp[(3) - (4)].cadena));
																insertar_polaca("CMP"); insertar_polaca("BGE"); insertar_polaca("@term1"); insertar_polaca("@term2");
																insertar_polaca("+"); insertar_polaca("@ret"); insertar_polaca("="); 
																insertar_polaca("@term2"); insertar_polaca("@term1"); insertar_polaca("="); 
																insertar_polaca("@ret"); insertar_polaca("@term2"); insertar_polaca("="); 
																insertar_polaca("@cont"); insertar_polaca("1"); insertar_polaca("+");
																insertar_polaca("@cont"); insertar_polaca("="); insertar_polaca("BI"); 
																insertar_polaca(convertir(desapilar(&pila_fib))); insertar_polaca("@ret"); 
																insertar_polaca("@fib"); insertar_polaca("="); 
																}
    break;

  case 47:
#line 203 "Sintactico.y"
    {
			printf ("R37: zonadec -> INIT { bloque_declaracion }\n");
			insertar_polaca((yyvsp[(1) - (4)].cadena));
		}
    break;

  case 48:
#line 210 "Sintactico.y"
    { printf ( "R38: bloque_declaracion -> bloque_declaracion declaracion\n"); }
    break;

  case 49:
#line 211 "Sintactico.y"
    { printf("R39: bloque_declaracion -> declaracion\n"); }
    break;

  case 50:
#line 215 "Sintactico.y"
    { printf("R40: declaracion -> multiple_dec : tipo\n"); insertar_polaca((yyvsp[(2) - (3)].cadena)); }
    break;

  case 51:
#line 219 "Sintactico.y"
    { printf("R41: multiple_dec -> multiple_dec , variable\n"); insertar_polaca((yyvsp[(2) - (3)].cadena)); }
    break;

  case 52:
#line 220 "Sintactico.y"
    { printf("R42: multiple_dec -> variable\n"); }
    break;

  case 53:
#line 224 "Sintactico.y"
    { printf("R43: variable -> ID\n"); insertar_polaca((yyvsp[(1) - (1)].cadena)); }
    break;

  case 54:
#line 228 "Sintactico.y"
    {printf ("R44: tipo -> FLOAT\n"); insertar_polaca((yyvsp[(1) - (1)].cadena));}
    break;

  case 55:
#line 229 "Sintactico.y"
    {printf ("R45: tipo -> INT\n"); insertar_polaca((yyvsp[(1) - (1)].cadena));}
    break;

  case 56:
#line 230 "Sintactico.y"
    {printf ("R46: tipo -> STRING\n"); insertar_polaca((yyvsp[(1) - (1)].cadena)); }
    break;

  case 57:
#line 234 "Sintactico.y"
    { printf ("R47: constante_string -> CTE_S\n"); insertar_polaca((yyvsp[(1) - (1)].cadena));}
    break;

  case 58:
#line 238 "Sintactico.y"
    { printf("R48: read -> READ (CTE_S)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 59:
#line 239 "Sintactico.y"
    {printf("R49: read -> READ (CTE_E)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 60:
#line 240 "Sintactico.y"
    {printf("R50: read -> READ (ID)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 61:
#line 241 "Sintactico.y"
    {printf("R51: read -> READ (CTE_R)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 62:
#line 244 "Sintactico.y"
    { printf("R51: write -> WRITE (CTE_S)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 63:
#line 245 "Sintactico.y"
    {printf("R52: write -> WRITE (CTE_E)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 64:
#line 246 "Sintactico.y"
    {printf("R53: write -> WRITE (ID)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena));}
    break;

  case 65:
#line 247 "Sintactico.y"
    {printf("R54: write -> WRITE (CTE_R)\n"); insertar_polaca((yyvsp[(1) - (4)].cadena)); insertar_polaca((yyvsp[(3) - (4)].cadena)); }
    break;


/* Line 1267 of yacc.c.  */
#line 1893 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 249 "Sintactico.y"



int main(int argc, char *argv[])
{
	crear_pila(&pila_comp);
	crear_pila(&pila_ciclo);
	crear_pila(&pila_fib);
	crear_pila(&pila_sel);

	
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\n\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
    }
    else
    { 
        
        yyparse();
        
    }
	
	fclose(yyin);
	//crear_TS();
		
    return 0;
}

int yyerror(void) {
	printf("\nError Sintactico\n");
	exit (1);
}

void insertar_polaca(char *dato) {
	polaca[indice] = dato;
	indice = indice + 1;
}

void escribir_polaca(char *dato,int pos) {
	polaca[pos] = dato;
}


void exportar() {
	FILE *archivo;
	int i = 0;
	archivo = fopen("intermedio.txt","a");
	for ( i = 0 ; i < indice ; i++){
		
		/*printf( "%d- %s\n",i,polaca[i]);*/
		fprintf( archivo , "posicion:%d  | %s |\n", i, polaca[i] );
	}
	fclose(archivo);
}

char *convertir( int a ) {
	char *buffer = malloc(2);
	sprintf(buffer,"%d",a);
	return buffer;
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


