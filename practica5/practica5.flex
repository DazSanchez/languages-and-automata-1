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
min {System.out.println("Symbol: min");}
mon {System.out.println("Symbol: mon");}
":==:" {System.out.println("Symbol: equivalent");}
":=" {System.out.println("Symbol: assign");}
":" {System.out.println("Symbol: dosp");}
"=" {System.out.println("Symbol: equals");}
[:digit:]+E("+"|"-")?[:digit:]+ {System.out.println("Symbol: exponential number - " + yytext());}
[:digit:]+ {System.out.println("Symbol: integer number - " + yytext());}
[:letter:]([:letter:]|[:digit:])* {System.out.println("Symbol: identifier - " + yytext());}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }