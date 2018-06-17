/* 定义区块部分  */

%{
	#include <stdio.h>
	#include "y.tab.h" 


int yywrap(void){
	return 1;
}

%}


/* 规则区块 对词法的描述 如果符合正则表达式就执行后面的动作 */

%%
"+" return ADD;
"-" return SUB;
"*" return MUL;
"/" return DIV;
"\n" return CR;

([1-9][0-9]*)|0|([0-9]+\.[0-9]+) {
	double temp;
	sscanf(yytext, "%lf", &temp);
	yylval.double_value = temp;
	return DOUBLE_LITERAL;
}
[ \t] ;
. {
	fprintf(stderr, "%s\n", "lexical error.\n");
	exit(1);
};
%%


/*用户代码区块 用户代码区块可以编写任意的C代码，不需要%{%}包裹 */


