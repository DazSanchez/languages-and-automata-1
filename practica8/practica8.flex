import java.io.*;
%%
%unicode
%line
%int
%{
  public static void main(String[] args){
    Yylex analizadorLexico = new Yylex(new InputStreamReader(System.in));
    try{
        System.out.println("Reading...");
      analizadorLexico.yylex();
    } catch(IOException x){
      System.out.println("Error in line ("+analizadorLexico.yyline+":"+analizadorLexico.yycolumn + ")");
    }
  }
%}
%%
/*Reglas léxicas*/
^((1[0-2]|0[:digit:])\:[0-5][:digit:]\ (am|pm))$ {System.out.println("Hora - " + yytext());}
^(0|[1-9][:digit:]*)$ {System.out.println("Entero - " + yytext());}
((i|I)(n|N)(t|T)(e|E)(g|G)(e|E)(r|R))|((r|R)(e|E)(a|A)(l|L))|((c|C)(h|H)(a|A)(r|R)) {System.out.println("Palabra reservada - " + yytext());}
[:letter:]([:digit:]|[:letter:]|_)* {System.out.println("Identificador - " + yytext());}

[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }