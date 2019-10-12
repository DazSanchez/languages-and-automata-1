import java.io.*;
%%
%unicode
%line
%int
%{
  public static void main(String[] args){
    Yylex analizadorLexico = new Yylex(new InputStreamReader(System.in));
    try{
      analizadorLexico.yylex();
    } catch(IOException x){
      System.out.println("Error in line ("+analizadorLexico.yyline+":"+analizadorLexico.yycolumn + ")");
    }
  }
%}
%%
/*Reglas léxicas*/
"/" {System.out.println("Symbol: mulop");}
"=" {System.out.println("Symbol: assop");}
"/=" {System.out.println("Symbol: mulassop");}
"+=" {System.out.println("Symbol: addassop");}
"/==/" {System.out.println("Symbol: equals");}
if {System.out.println("Reserved word: IF");}
ifthen {System.out.println("Reserved word: IFTHEN");}
iftrue {System.out.println("Reserved word: IFTRUE");}
oftrue {System.out.println("Reserved word: OFTRUE");}
[a-zA-Z][a-zA-Z0-9]* {System.out.println("Characters sequence");}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }