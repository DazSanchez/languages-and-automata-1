import java_cup.runtime.*;
%%
%cup
%public
%unicode
%line
%int
%{
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    private void log() {
        System.out.println(yytext());
    }
%}
%%
"||" {log();return symbol(sym.OR);}
[0-9]* {log();return symbol(sym.ENT);}
\"(.)*\" {log();return symbol(sym.STR);}
/*PALABRAS RESERVADAS*/
"main" {log();return symbol(sym.MAIN); }
"while" {log();return symbol(sym.WHILE); }
"if" {log();return symbol(sym.IF); }
"else" {log();return symbol(sym.ELSE); }
"break" {log();return symbol(sym.BREAK);}
"puts" {log();return symbol(sym.PUTS);}
"putw" {log();return symbol(sym.PUTW);}
"int" {log();return symbol(sym.INT);}
/*TOKENS*/
[a-z|A-Z|_][a-z|A-Z|_|0-9]* {log();return symbol(sym.IDENT);}
/*DELIMITADORE*/
";"  {log();return symbol(sym.EOL);}
//"\"" {log();return symbol(sym.DBQUOTE);}
"(" {log();return symbol(sym.OP);}
")"  {log();return symbol(sym.CP);}
"{"  {log();return symbol(sym.OB);}
"}"  {log();return symbol(sym.CB);}
/*OPERDADORES ARITMETICOS*/
"+" {log();return symbol(sym.SUM);}
"-" {log();return symbol(sym.RES);}
"*" {log();return symbol(sym.MUL);}
"/" {log();return symbol(sym.DIV);}
/*OPERADORES RELACIONALES*/
"<" {log();return symbol(sym.LT);}
">" {log();return symbol(sym.GT);}
"==" {log();return symbol(sym.EQ);}
"!=" {log();return symbol(sym.NE);}
/*OPERADORES LÓGICOS*/
"&&" {log();return symbol(sym.AND);}
/*OPERADOR DE ASIGNACION*/
"=" {log();return symbol(sym.ASG);}
[ \t\r\n]+ {;}
. {System.out.println("Error léxico: "+ yytext());}