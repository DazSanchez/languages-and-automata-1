package analizer;
import java.io.*;
%%
%unicode
%line
%int
%{
    private StringBuffer buffer = new StringBuffer();

    public static Yylex init(InputStreamReader r) {
        Yylex lex = new Yylex(r);
        return lex;
    }

    void append(String token) {
        buffer.append(token).append(" ");
        buffer.append("\n");
    }

    void error() {
        String msg = "Error lexico en: " + yytext();
        append(msg);
    }

    public String getResult() {
        return buffer.toString();
    }
%}

IDENTIFIER = [:letter:][:letter:]*

%%
/*Reglas léxicas*/
"turnOn"\ {IDENTIFIER} {append("PROGRAM START");}
"turnOff" {append("PROGRAM EXIT");}

(v|f)b {append("BOOL");}
[:digit:]+i {append("NUM");}
[:digit:]+(\.[:digit:]*)?d {append("NUMDEC");}

"<nxt" {append("NEXTLN");}
"is" {append("ASIG");}
"lt" {append("LESS-THAN");}
"gt" {append("GREATHER-THAN");}
"pls" {append("PLUS");}
"mns" {append("MINUS");}
"dvdr" {append("DIV");}
"mlt" {append("MUL");}
"\*(" {append("OPEN-PARENTESIS");}
")\*" {append("CLOSE-PARENTESIS");}
"iseq" {append("EQUALS");}
"," {append("COMMA");}
"\*{" {append("OPEN-BRAKET");}
"}\*" {append("CLOSE-BRAKET");}

"psh" {append("PUSH");}

{IDENTIFIER} {append("IDENT");}

[\ \n\t\r] {/* NO HACER NADA */}
. { error(); }