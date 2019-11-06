import java.io.*;
%%
%class PascalAnalizer
%unicode
%line
%int
%{
  public static void main(String[] args){
    PascalAnalizer analizadorLexico = new PascalAnalizer(new InputStreamReader(System.in));
    try{
        System.out.println("Reading...");
      analizadorLexico.yylex();
    } catch(IOException x){
      System.out.println("Error in line ("+analizadorLexico.yyline+":"+analizadorLexico.yycolumn + ")");
    }
  }
%}
BLANK = (\ )
EOL = \;
LB = \n
EQ = \=
ASSIGN = \:\=
OP = \(
CP = \)
END = end{EOL}
OB = \[
CB = \]

RESERVED_WORD = and|array|begin|case|const|div|do|downto|else|end|file|for|function|goto|if|in|label|mod|nil|not|of|or|packed|procedure|program|record|repeat|set|then|to|type|until|var|while|with|integer|real|boolean|char|string
IDENTIFIER = [:letter:]([:letter:]|[:digit:]|_)*

ARITHMETIC_OPERATOR = (\+)|(\-)|(\*)|(\/)|(%)
RELATIONAL_OPERATOR = (\<=)|(\>=)|(\<)|(\>)|{EQ}|(<>)
BOOLEAN_OPERATOR = and|(and then)|or|(or else)
NOT = not{BLANK}
RANGE_OPERATOR = \.\.\.
SIGN = \+|\-
EXPONENTIAL_OPERATOR = e|E

INTEGER = (0|[1-9][:digit:]*)
REAL = {INTEGER}+\.[:digit:]+
NUMERIC = {SIGN}?({INTEGER}|{REAL})
EXPONENTIAL = {NUMERIC}{EXPONENTIAL_OPERATOR}{SIGN}?{INTEGER}
CHAR = \'[^\']\'
STRING = \'[^\']*\'
BOOLEAN = true|false
ENUM = {OP}{IDENTIFIER}(\,{IDENTIFIER})*{CP}

VALUE_TYPE = integer|real|char|boolean|string({OB}({INTEGER}|{IDENTIFIER}){CB})?|{IDENTIFIER}
LITERAL_VALUE = {NUMERIC}|{BOOLEAN}|{CHAR}|{ENUM}|{STRING}|{EXPONENTIAL}|nil
VALUE_DEFINITION = {LITERAL_VALUE}|{ENUM}

RELATIONAL_OPERAND = {NOT}?({IDENTIFIER}|{NUMERIC}|{BOOLEAN}|{CHAR}|{STRING})

ARITHMETIC_OPERATION = {NUMERIC}{BLANK}?{ARITHMETIC_OPERATOR}{BLANK}?{NUMERIC}({BLANK}?{ARITHMETIC_OPERATOR}{BLANK}?{NUMERIC})*
RELATIONAL_OPERATION = {RELATIONAL_OPERAND}{BLANK}?{RELATIONAL_OPERATOR}{BLANK}?{RELATIONAL_OPERAND}
SIMPLE_BOOLEAN_OPERATION = {NOT}?{BOOLEAN}
BOOLEAN_OPERAND = ({SIMPLE_BOOLEAN_OPERATION}|{RELATIONAL_OPERATION})

COMPLEX_BOOLEAN_OPERATION = {BOOLEAN_OPERAND}{BLANK}?{BOOLEAN_OPERATOR}{BLANK}?{BOOLEAN_OPERAND}({BLANK}?{BOOLEAN_OPERATOR}{BLANK}?{BOOLEAN_OPERAND})*
BOOLEAN_OPERATION = ({SIMPLE_BOOLEAN_OPERATION}|{COMPLEX_BOOLEAN_OPERATION})

IDENTIFIER_LIST = {IDENTIFIER}({BLANK}?\,{BLANK}?{IDENTIFIER})*
VAR_DECLARATION = {IDENTIFIER_LIST}{BLANK}*\:{BLANK}*{VALUE_TYPE}({BLANK}*{EQ}{BLANK}*{VALUE_DEFINITION})?{EOL}
TYPE_DECLARATION = {IDENTIFIER_LIST}{BLANK}*{EQ}{BLANK}*({VALUE_TYPE}|{ENUM}){EOL}
CONST_DECLARATION = {IDENTIFIER}{BLANK}*{EQ}{BLANK}*{VALUE_DEFINITION}{EOL}
RANGE_DECLARATION = ({LITERAL_VALUE}|{IDENTIFIER}){RANGE_OPERATOR}({LITERAL_VALUE}|{IDENTIFIER})

BASIC_EXPRESSION = {IDENTIFIER}|{LITERAL_VALUE}|{ARITHMETIC_OPERATION}|{RELATIONAL_OPERATION}|{BOOLEAN_OPERATION}

FUNCTION_CALL_ARGUMENT = {IDENTIFIER}|{LITERAL_VALUE}|{BASIC_EXPRESSION}
FUNCTION_CALL = {IDENTIFIER}{OP}{FUNCTION_CALL_ARGUMENT}(\,{BLANK}?{FUNCTION_CALL_ARGUMENT})*{CP}

EXPRESSION = {BASIC_EXPRESSION}|{FUNCTION_CALL}

IF = if{BLANK}
CONDITION = {OP}({IDENTIFIER}|{RELATIONAL_OPERATION}|{BOOLEAN_OPERATION}){CP}{BLANK}
THEN = then{BLANK}
ELSE = else{BLANK}
ELSE_IF_THEN_EXPRESSION = {ELSE}{IF}{CONDITION}{THEN}{EXPRESSION}{EOL}
IF_THEN_EXPRESSION = {IF}{CONDITION}{THEN}{EXPRESSION}{EOL}
ELSE_EXPRESSION = {ELSE}{EXPRESSION}{EOL}

CASE_EXPRESSION_TYPE = {INTEGER}|{IDENTIFIER}
CASE_EXPRESSION = {OP}{CASE_EXPRESSION_TYPE}{CP}
CASE = case{BLANK}
OF = of{LB}?
CASE_LABEL = {CASE_EXPRESSION_TYPE}(\,{CASE_EXPRESSION_TYPE})*\:{EXPRESSION}{EOL}{LB}?

CASE_STATEMENT = {CASE}{CASE_EXPRESSION}{OF}{CASE_LABEL}+
CASE_ELSE = {ELSE}{EXPRESSION}{EOL}{LB}?

DO = do{BLANK}
WHILE = while{BLANK}
WHILE_STATEMENT = {WHILE}{CONDITION}{DO}{EXPRESSION}{EOL}

FOR = for{BLANK}
FOR_VAR_INIT = {IDENTIFIER}{BLANK}{ASSIGN}{BLANK}({NUMERIC}|{IDENTIFIER}){BLANK }
FOR_CONDITION = (to|downto){BLANK}({NUMERIC}|{IDENTIFIER}){BLANK}
FOR_STATEMENT = {FOR}{FOR_VAR_INIT}{FOR_CONDITION}{DO}{EXPRESSION}{EOL}

REPEAT = repeat({LB}|{BLANK})?
REPEAT_EXPRESSIONS_BLOCK = {EXPRESSION}{EOL}({LB}|{BLANK})?
UNTIL = until{BLANK}({BOOLEAN_OPERATION}|{RELATIONAL_OPERATION})
REPEAT_STATEMENT = {REPEAT}{REPEAT_EXPRESSIONS_BLOCK}+{UNTIL}{EOL}

FUNCTION = function{BLANK}
FUNCTION_NAME = {IDENTIFIER}
FUNCTION_RETURN_TYPE = {VALUE_TYPE}
FUNCTION_ARGUMENT = {IDENTIFIER}\:{BLANK}{VALUE_TYPE}
FUNCTION_ARGUMENTS_DEFINITION = {OP}{FUNCTION_ARGUMENT}(\,{BLANK}?{FUNCTION_ARGUMENT})*{CP}
FUNCTION_DEFINITION_STATEMENT = {FUNCTION}{FUNCTION_NAME}{FUNCTION_ARGUMENTS_DEFINITION}\:{BLANK}{FUNCTION_RETURN_TYPE}{EOL}

PROCEDURE = procedure{BLANK}
PROCEDURE_DEFINITION_STATEMENT = {PROCEDURE}{FUNCTION_NAME}{FUNCTION_ARGUMENTS_DEFINITION}{EOL}

%%
/*Reglas léxicas*/
\{\*(.*)(\n)?\*\} {System.out.println("Multi line comment - " + yytext());}
\{[^\*](.*)\} {System.out.println("Single line comment - " + yytext());}

/*Declaracion de programa*/
program{BLANK}{IDENTIFIER} {System.out.println("Program declaration - " + yytext());}

/*Declaracion de tipos de datos*/
type{BLANK}?{TYPE_DECLARATION} {System.out.println("Type definition - " + yytext());}

/*Declaracion de variables*/
var{BLANK}?({VAR_DECLARATION}|{RANGE_DECLARATION}) {System.out.println("Variable definition - " + yytext());}

/*Declararion de constantes*/
const{BLANK}?{CONST_DECLARATION} {System.out.println("Constants declaration - " + yytext());}

/*Asignacion de valor*/
{IDENTIFIER}{BLANK}?{ASSIGN}{BLANK}?{EXPRESSION}{EOL} {System.out.println("Value assignation - " + yytext());}

begin {System.out.println("Code block start");}
{END} {System.out.println("Code block end");}

/*Bloques condicionales*/
{IF_THEN_EXPRESSION} {System.out.println("Conditional block if-then - " + yytext());}
{IF_THEN_EXPRESSION}{BLANK}{ELSE_EXPRESSION} {System.out.println("Conditional block if-then-else - " + yytext());}
{IF_THEN_EXPRESSION}{BLANK}({ELSE_IF_THEN_EXPRESSION}{BLANK}?)+{ELSE_EXPRESSION} {System.out.println("Multi Conditional block if-then-else - " + yytext());}
{CASE_STATEMENT}{CASE_ELSE}{END} {System.out.println("Case-else block");}
{CASE_STATEMENT}{END} {System.out.println("Case block");}

/*Ciclos*/
{WHILE_STATEMENT} {System.out.println("While-do loop - " + yytext());}
{FOR_STATEMENT} {System.out.println("For-do loop - " + yytext());}
{REPEAT_STATEMENT} {System.out.println("repeat-until loop - " + yytext());}

/*Funciones*/
{FUNCTION_DEFINITION_STATEMENT} {System.out.println("Function definition - " + yytext());}

/*Procedimientos*/
{PROCEDURE_DEFINITION_STATEMENT} {System.out.println("Procedure definition - " + yytext());}

[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }