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
(true|false) {System.out.println("CLOG");}
and {System.out.println("AND");}
or {System.out.println("OR");}
[a-z][a-z0-9]* {System.out.println("IDENT");}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Error léxico."+yytext() ); }