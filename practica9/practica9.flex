import java.io.*;
%%
%unicode
%line
%int
%{
public static void main(String[] args){
Yylex analizadorLexico=new Yylex(new InputStreamReader(System.in));
try{
analizadorLexico.yylex();
}
catch(IOException x){
System.out.println("Error en la línea"+analizadorLexico.yyline+" columna "+analizadorLexico.yycolumn) ;
}
}
%}
%%
(\"(.)*\") {System.out.println("STR");}
/*PALABRAS RESERVADAS*/
"main" { System.out.println("PALABARA RESERVADA: MAIN"); }
"while" { System.out.println("PALABARA RESERVADA: WHILE"); }
"if" { System.out.println("PALABARA RESERVADA: IF"); }
"else" { System.out.println("PALABARA RESERVADA:ELSE"); }
"break" { System.out.println("PALABARA RESERVADA: BREAK"); }
"puts" { System.out.println("PALABARA RESERVADA: PUTS"); }
"putw" { System.out.println("PALABARA RESERVADA: PUTW"); }
"int" { System.out.println("PALABARA RESERVADA Y TIPO DE DATO ENTERO"); }
/*TOKENS*/
[a-z|A-Z|_][a-z|A-Z|_|0-9]* { System.out.println("TOKEN/IDENTIFICADOR"); }
[0-9]* { System.out.println("NUMERO ENTERO"); }
/*DELIMITADORE*/
";"  { System.out.println("DELIMITADOR: PUNTO Y COMA"); }
//"\""  { System.out.println("DELIMITADOR: COMILLA"); }
"(" { System.out.println("DELIMITADOR: PARENTESIS IZQ"); }
")"  { System.out.println("DELIMITADOR: PARENTESIS DERC"); }
"{"  { System.out.println("DELIMITADOR: LLAVE IZQ"); }
"}"  { System.out.println("DELIMITADOR: LLAVE DERC"); }
/*OPERDADORES ARITMETICOS*/
"+" { System.out.println("OPERDADORES ARITMETICOS: SUMA"); }
"-" { System.out.println("OPERDADORES ARITMETICOS: RESTA"); }
"*" { System.out.println("OPERDADORES ARITMETICOS:PRODUCTO"); }
"/" { System.out.println("OPERDADORES ARITMETICOS: DIVISIÓN"); }
/*OPERADORES RELACIONALES*/
"<" { System.out.println("OPERDADORES RELACIONES: MENOR"); }
">" { System.out.println("OPERDADORES RELACIONES: MAYOR"); }
"==" { System.out.println("OPERDADORES RELACIONES: IGUAL"); }
"!=" { System.out.println("OPERDADORES RELACIONES: DISTINTO"); }
/*OPERADORES LÓGICOS*/
"||" { System.out.println("OPERDADORES LOGICOS: OR"); }
"&&" { System.out.println("OPERDADORES LOGICOS: AND"); }
/*OPERADOR DE ASIGNACION*/
"=" { System.out.println("OPERDADOR DE ASIGNACION"); }
[ \t\r\n]+ {/*SOLO RECONOCE LOS ELEMENTOS PERO NO HACE NINGUNA ACCION*/;}
. { System.out.println("Error léxico."+ yytext() ); }
	