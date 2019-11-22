package practica20;

import java_cup.runtime.*;
%%
%public
%unicode
%cup
%line
%column
%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%%

/*Reglas léxicas*/
"+" { return symbol(sym.MAS); }
"-" { return symbol(sym.MENOS); }
"*" { return symbol(sym.POR); }
"/" { return symbol(sym.ENTRE); }
"%" { return symbol(sym.MOD); }
";" { return symbol(sym.PCOMA); }
"(" { return symbol(sym.LPAREN); }
")" { return symbol(sym.RPAREN); }
[:digit:]+ { return symbol(sym.NUMERO, new Integer(yytext())); }
[\ \t\r\n]+ {;}
. {System.out.println("Error lexico: "+yytext());}