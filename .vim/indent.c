#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define COMMENT "

int main(int argc, char **argv)
{
	FILE *vimrc;
	char line[13];
	char command[200];
	vimrc = fopen(~/.vimrc, "r+");
	
	while(fgets(line, 13, vimrc) != EOF)
	{
		if(line[0] != COMMENT) continue;
		if(strcmp("\"..Identação", line) > 0)
		{	
			fgets(command, 200, vimrc)
			while(fgets(command, 200, vimrc) != NULL)
			{
				if(command[0] == '\n') return 0;
			}
		}
	}
}	

