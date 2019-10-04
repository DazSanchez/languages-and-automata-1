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
/*Reglas léxicas*/
"+" { System.out.println ("simbolo: MAS"); }
"-" { System.out.println ("simbolo: MENOS"); }
"*" { System.out.println ("simbolo: POR"); }
"/" { System.out.println ("simbolo: ENTRE"); }
"%" { System.out.println ("simbolo: MODULO"); }
";" { System.out.println ("simbolo: PUNTO Y COMA"); }
"(" { System.out.println ("simbolo: PARENTESIS IZQUIERDO"); }
")" { System.out.println ("simbolo: PARENTESIS DERECHO"); }
[:digit:]+ { System.out.println ("simbolo: CANTIDAD"); }
[ \t\r\n]+ {/*SOLO RECONOCE LOS ELEMENTOS PERO NO HACE NINGUNA ACCION*/;}
. { System.out.println("Error léxico."+yytext() ); }