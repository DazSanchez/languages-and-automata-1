import java.io.*;
%%
%unicode
%line
%int
%{
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

IDENTIFIER = [:letter:][:letter:]*

%%
/*Reglas léxicas*/
"turnOn" {System.out.println("PROGRAM START");}
"turnOff" {System.out.println("PROGRAM EXIT");}

(v|f)b {System.out.println("BOOL");}
[:digit:]+i {System.out.println("NUM");}
[:digit:]+(\.[:digit:]*)?d {System.out.println("NUMDEC");}


"<nxt" {System.out.println("NEXTLN");}
"is" {System.out.println("ASIG");}
"lt" {System.out.println("LESS-THAN");}
"gt" {System.out.println("GREATHER-THAN");}
"pls" {System.out.println("PLUS");}
"mns" {System.out.println("MINUS");}
"dvdr" {System.out.println("DIV");}
"mlt" {System.out.println("MUL");}
"\*(" {System.out.println("OPEN-PARENTESIS");}
")\*" {System.out.println("CLOSE-PARENTESIS");}
"iseq" {System.out.println("EQUALS");}
"," {System.out.println("COMMA");}
"\*{" {System.out.println("OPEN-BRAKET");}
"}\*" {System.out.println("CLOSE-BRAKET");}

"psh" {System.out.println("PUSH");}

{IDENTIFIER} {System.out.println("IDENT");}

[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }