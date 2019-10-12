import java.io.*;
%%
%unicode
%line
%int
%{
  public static void main(String[] args){
    Yylex analizadorLexico = new Yylex(new InputStreamReader(System.in));
    try{
        System.out.println("Reading...");
      analizadorLexico.yylex();
    } catch(IOException x){
      System.out.println("Error in line ("+analizadorLexico.yyline+":"+analizadorLexico.yycolumn + ")");
    }
  }
%}
%%
/*Reglas léxicas*/

/*Strings*/
\"[^\"]*\" {System.out.println("Literal: String - " + yytext());}

/* --- Palabras reservadas*/
abstract {System.out.println("Reserved word: Abstract class - " + yytext());}
boolean {System.out.println("Reserved word: Boolean type - " + yytext());}
break {System.out.println("Reserved word: Loop cycle breaker - " + yytext());}
byte {System.out.println("Reserved word: Byte type - " + yytext());}
byvalue {System.out.println("Reserved word - " + yytext());}
case {System.out.println("Reserved word: Switch case - " + yytext());}
catch {System.out.println("Reserved word: Error catch - " + yytext());}
char {System.out.println("Reserved word: Character type - " + yytext());}
class {System.out.println("Reserved word: Class - " + yytext());}
const {System.out.println("Reserved word: Constant - " + yytext());}
continue {System.out.println("Reserved word: Loop cycle skipper - " + yytext());}
default {System.out.println("Reserved word: Default  - " + yytext());}
do {System.out.println("Reserved word: Do block  - " + yytext());}
double {System.out.println("Reserved word: Double type  - " + yytext());}
else {System.out.println("Reserved word: Conditional default case  - " + yytext());}
extends {System.out.println("Reserved word: Class extender  - " + yytext());}
false {System.out.println("Reserved word: Boolean value  - " + yytext());}
final {System.out.println("Reserved word: Constant type  - " + yytext());}
finally {System.out.println("Reserved word: Final post error execution block  - " + yytext());}
float {System.out.println("Reserved word: Floating type  - " + yytext());}
for {System.out.println("Reserved word: Loop  - " + yytext());}
goto {System.out.println("Reserved word  - " + yytext());}
if {System.out.println("Reserved word: Conditional  - " + yytext());}
implements {System.out.println("Reserved word: Interface extender  - " + yytext());}
import {System.out.println("Reserved word: Library import definition  - " + yytext());}
instanceof {System.out.println("Reserved word: Class instance comparator  - " + yytext());}
int {System.out.println("Reserved word: Integer type  - " + yytext());}
interface {System.out.println("Reserved word: Interface definition  - " + yytext());}
long {System.out.println("Reserved word: Long Integer type  - " + yytext());}
native {System.out.println("Reserved word  - " + yytext());}
new {System.out.println("Reserved word: New class instanciation - " + yytext());}
null {System.out.println("Reserved word: Null value  - " + yytext());}
package {System.out.println("Reserved word: Class package definition  - " + yytext());}
private {System.out.println("Reserved word: Private access modifier - " + yytext());}
protected {System.out.println("Reserved word: Protected access modifier  - " + yytext());}
public {System.out.println("Reserved word: Public access modifier - " + yytext());}
return {System.out.println("Reserved word: Method value return - " + yytext());}
short {System.out.println("Reserved word: Short Integer type - " + yytext());}
static {System.out.println("Reserved word: Static attribute definition - " + yytext());}
super {System.out.println("Reserved word: Extended class accessor - " + yytext());}
switch {System.out.println("Reserved word: Switch block  - " + yytext());}
synchronized {System.out.println("Reserved word: Thread synchronization - " + yytext());}
this {System.out.println("Reserved word: Self class accessor - " + yytext());}
threadsafe {System.out.println("Reserved word: Thread safety mark - " + yytext());}
throw[s]? {System.out.println("Reserved word: Exception invocation - " + yytext());}
transcient {System.out.println("Reserved word - " + yytext());}
true {System.out.println("Reserved word: Boolean value - " + yytext());}
try {System.out.println("Reserved word: Error prone block - " + yytext());}
void {System.out.println("Reserved word: Non-returning value method - " + yytext());}
while {System.out.println("Reserved word: While loop - " + yytext());}
cast {System.out.println("Reserved word  - " + yytext());}
operator {System.out.println("Reserved word  - " + yytext());}
future {System.out.println("Reserved word - " + yytext());}
outer {System.out.println("Reserved word - " + yytext());}
generic {System.out.println("Reserved word - " + yytext());}
rest {System.out.println("Reserved word - " + yytext());}
inner {System.out.println("Reserved word - " + yytext());}
var {System.out.println("Reserved word - " + yytext());}

/*Identifiers*/
[:jletter:][:jletterdigit:]* {System.out.println("Identifier - " + yytext());}

/*Comments*/
"//" {System.out.println("Single line comment - " + yytext());}
"/*" {System.out.println("Multi-line comment start - " + yytext());}
"/**" {System.out.println("Multi-line documentation comment start - " + yytext());}
"*/" {System.out.println("Multi-line comment end - " + yytext());}

/* --- Operators*/
/*Assignation*/
= {System.out.println("Operator: Assignment - " + yytext());}

/*Relational*/
== {System.out.println("Operator: Equals - " + yytext());}
\!= {System.out.println("Operator: Not Equals - " + yytext());}
\< {System.out.println("Operator: Less than - " + yytext());}
\> {System.out.println("Operator: Greater than - " + yytext());}
\<= {System.out.println("Operator: Less than or Equals - " + yytext());}
\>= {System.out.println("Operator: Greater than or Equals - " + yytext());}

/*Binary*/


/*Math*/
"++" {System.out.println("Operator: (Post|Pre)-increment - " + yytext());}
"--" {System.out.println("Operator: (Post|Pre)-decrement - " + yytext());}
\+ {System.out.println("Operator: Add - " + yytext());}
\- {System.out.println("Operator: Sub - " + yytext());}
\* {System.out.println("Operator: Mult - " + yytext());}
\/ {System.out.println("Operator: Div - " + yytext());}
% {System.out.println("Operator: Mod - " + yytext());}

/*Logical*/
&& {System.out.println("Logical Operator: AND - " + yytext());}
"||" {System.out.println("Logical Operator: OR - " + yytext());}
\! {System.out.println("Logial Operator: NOT - " + yytext());}

/* --- Literals*/
/*Reals*/
[:digit:]+(\.[:digit:]+)?[e|E][:digit:]+ {System.out.println("Literal: Exponencial - " + yytext());}
[:digit:]+\.[:digit:]+f {System.out.println("Literal: Float - " + yytext());}
[:digit:]+\.[:digit:]+d? {System.out.println("Literal: Double - " + yytext());}

/*Integers*/
0x([:digit:]|[A-F])+ {System.out.println("Literal: Hex - " + yytext());}
0[0-7]* {System.out.println("Literal: Octal - " + yytext());}
[:digit:]+L {System.out.println("Literal: Long Integer - " + yytext());}
[:digit:]+ {System.out.println("Literal: Integer - " + yytext());}

/*Characters*/
[\'](\\u0x([:digit:]|[A-F])+|\\[:letter:]|.?)[\'] {System.out.println("Literal: Character - " + yytext());}

/*Delimiters*/
\( {System.out.println("Delimiter: Open parenteses - " + yytext());}
\) {System.out.println("Delimiter: Close parenteses - " + yytext());}
\{ {System.out.println("Delimiter: Open brace - " + yytext());}
\} {System.out.println("Delimiter: Close brace - " + yytext());}
\[ {System.out.println("Delimiter: Open bracket - " + yytext());}
\] {System.out.println("Delimiter: Close bracket - " + yytext());}
\; {System.out.println("End of Expression delimiter - " + yytext());}
\, {System.out.println("Delimiter: Array element delimiter - " + yytext());}
\. {System.out.println("Delimiter: Access object member - " + yytext());}

[ \n\t\r] {/* NO HACER NADA */}
. { System.out.println("Lexical error: "+yytext() ); }