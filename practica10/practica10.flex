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

IDENTIFIER = [:letter:]([:letter:]|[:digit:])*

%%
/*Reglas léxicas*/
\".*\" {System.out.println("CSTR");}

[:digit:]+ {System.out.println("CINT");}
(true|false) {System.out.println("CLOG");}

"begin" {System.out.println("BEGIN");}
"and" {System.out.println("AND");}
"or" {System.out.println("OR");}
"not" {System.out.println("OR");}
"pf2019" {System.out.println("PROG");}
"decl" {System.out.println("DECL");}
"while" {System.out.println("WHILE");}
"do" {System.out.println("DO");}
"print" {System.out.println("PRINT");}
"in" {System.out.println("IN");}
"union" {System.out.println("UNION");}
"intersec" {System.out.println("INTERSEC");}
"card" {System.out.println("CARD");}
"lowest_elem" {System.out.println("LOWEST_ELEM");}
"int2str" {System.out.println("INT2STR");}
"abs" {System.out.println("ABS");}
"emptyset" {System.out.println("EMPTYSET");}
"if" {System.out.println("IF");}
"then" {System.out.println("THEN");}
"end" {System.out.println("END");}
(int|bool|str|intset) {System.out.println("TYPE");}

{IDENTIFIER} {System.out.println("IDENT");}

";" {System.out.println("PC");}
":=" {System.out.println("ASIG");}
"<" {System.out.println("MENOR");}
">" {System.out.println("MAYOR");}
"+" {System.out.println("MAS");}
"-" {System.out.println("MENOS");}
"/" {System.out.println("DIV");}
"*" {System.out.println("MUL");}
"(" {System.out.println("PAREN");}
")" {System.out.println("TESIS");}
"=" {System.out.println("IGUAL");}
"," {System.out.println("COMA");}
"{" {System.out.println("BRAC");}
"}" {System.out.println("KET");}

[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }