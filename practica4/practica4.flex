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
[1-9][:digit:]* {System.out.println("Symbol: integer number - " + yytext());}
[0][0-7]* {System.out.println("Symbol: octal number - " + yytext());}
[0][x][0-9A-F]+ {System.out.println("Symbol: hex number - " + yytext());}
[:letter:]([:letter:]|[:digit:]) {System.out.println("Symbol: identifier - " + yytext());}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }