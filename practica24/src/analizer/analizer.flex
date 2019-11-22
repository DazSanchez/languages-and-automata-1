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
min {return symbol(sym.MIN);}
mon {return symbol(sym.MON);}
":==:" {return symbol(sym.EQUI);}
":=" {return symbol(sym.ASSIGN);}
":" {return symbol(sym.DOSP);}
"=" {return symbol(sym.EQ);}
[:digit:]+E("+"|"-")?[:digit:]+ {return symbol(sym.EXP_NUM);}
[:digit:]+ {return symbol(sym.INT);}
[:letter:]([:letter:]|[:digit:])* {return symbol(sym.IDENT);}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }