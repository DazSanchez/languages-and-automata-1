package analizador;

import java_cup.runtime.*;
%%
%public
%cup
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
%}
%%
/*Reglas léxicas*/
(true|false) {return symbol(sym.CLOG);}
and {return symbol(sym.AND);}
or {return symbol(sym.OR);}
[a-z][a-z0-9]* {return symbol(sym.IDENT);}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Error léxico."+yytext() ); }