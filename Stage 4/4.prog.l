/*Stage 4*/
%{
#include<stdlib.h>
#include<stdio.h>
#include "tree.h"
#include "y.tab.h"
%}

%option noyywrap  

%%
"read" 			{yylval.ptr = TreeCreate(VOID_TYPE, READ_NODETYPE, 0 , NULL, NULL, NULL, NULL); return READ;}
"write"			{yylval.ptr = TreeCreate(VOID_TYPE, WRITE_NODETYPE, 0 , NULL, NULL, NULL, NULL); return WRITE;}
"if" 			{yylval.ptr = TreeCreate(VOID_TYPE, IF_NODETYPE, 0 , NULL, NULL, NULL, NULL); return IF;}
"then"			return THEN;
"endif" 		return ENDIF;
"while" 		{yylval.ptr = TreeCreate(VOID_TYPE, WHILE_NODETYPE, 0 , NULL, NULL, NULL, NULL); return WHILE;}
"do" 			return DO;
"endwhile" 		return ENDWHILE;
"=="			{yylval.ptr = TreeCreate(BOOL_TYPE, EQ_NODETYPE, 0 , NULL, NULL, NULL, NULL); return EQ;}
"<"			{yylval.ptr = TreeCreate(BOOL_TYPE, LT_NODETYPE, 0 , NULL, NULL, NULL, NULL); return LT;}
">"			{yylval.ptr = TreeCreate(BOOL_TYPE, GT_NODETYPE, 0 , NULL, NULL, NULL, NULL); return GT;}
[+*=]			{
			switch(*yytext){
			    case '+': yylval.ptr = TreeCreate(INT_TYPE, PLUS_NODETYPE, 0 , NULL, NULL, NULL, NULL); return PLUS;
			    case '*': yylval.ptr = TreeCreate(INT_TYPE, MUL_NODETYPE, 0 , NULL, NULL, NULL, NULL); return MUL; 
                 	    case '=': yylval.ptr = TreeCreate(INT_TYPE, ASG_NODETYPE, 0 , NULL, NULL, NULL, NULL); return ASG; 			
			}}
[;()\n]			return *yytext; 	
[a-z]			{yylval.ptr = TreeCreate(VOID_TYPE, ID_NODETYPE, 0, yytext, NULL, NULL, NULL); return ID;}
[0-9]+	 		{yylval.ptr = TreeCreate(INT_TYPE, NUM_NODETYPE, atoi(yytext),NULL, NULL, NULL, NULL); return NUM;}
[ \t]	 		{}
. 			{}
%%

