package practica9;

import java.io.*;
import CurrentToken;
%%
%unicode
%line
%int
%{
    static CurrentToken currentToken;

    public static void main(String[] args){
        Yylex lexicalAnalizer = new Yylex(new InputStreamReader(System.in));
        try{
            System.out.println("Reading...");
            lexicalAnalizer.yylex();
        } catch(IOException x){
            System.out.println("Error in line (" + lexicalAnalizer.yyline + ":" + lexicalAnalizer.yycolumn + ")");
        }
    }
%}

OP = \(
CP = \)
EOL = \;
OB = \{
CB = \}

%%
/*Reglas léxicas*/

[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }