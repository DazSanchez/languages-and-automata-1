package analizer;

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
[1-9][:digit:]* {return symbol(sym.INT);}
[0][0-7]* {return symbol(sym.OCT);}
[0][x][0-9A-F]+ {return symbol(sym.HEX);}
[:letter:]([:letter:]|[:digit:])* {return symbol(sym.IDENT);}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }