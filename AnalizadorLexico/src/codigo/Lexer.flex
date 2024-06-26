/* Este es del Prolog que esta funcionando */
package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-z][a-zA-Z0-9_]*
V=[A-Z_][a-zA-Z0-9_]*
D=[0-9]+
espacio=[ \t\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "%"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Punto */
( "." ) {lexeme=yytext(); return Punto;}

/* Operador Igual */
( "=" | "is" ) {lexeme=yytext(); return Igual;}

/*Operadores Booleanos*/
(true | fail)      {lexeme = yytext(); return Op_booleano;}

/* Palabras clave */
(  mod | div | not | and | or | if | else | elseif | then | repeat  | false | write | read ) {lexeme=yytext(); return Palabra_clave;}


/* Átomos */
{L} { lexeme=yytext(); return Atom; }

/* Variables */
{V} { lexeme=yytext(); return Variable; }

/* Números */
{D} { lexeme=yytext(); return Numero; }

 
/* Coma */
"," { lexeme=yytext(); return Coma; }

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Comilla Simple */
( "'" ) {lexeme=yytext(); return Comilla;}






/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}





/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}



/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}



/* Error de analisis */
 . {return ERROR;}
