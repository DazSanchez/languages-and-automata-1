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
"/" {return symbol(sym.MULOP);}
"=" {return symbol(sym.ASSOP);}
"/=" {return symbol(sym.MULASSOP);}
"+=" {return symbol(sym.ADDASSOP);}
"/==/" {return symbol(sym.EQUALS);}
if {return symbol(sym.IF);}
ifthen {return symbol(sym.IFTHEN);}
iftrue {return symbol(sym.IFTRUE);}
oftrue {return symbol(sym.OFTRUE);}
[a-zA-Z][a-zA-Z0-9]* {return symbol(sym.IDENT);}
[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }