#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

extern int errno;
int
main(int argc, char **argv)
{
	errno = 0;
	/*printf("argv[1] = %s \n", argv[1]);*/

	unsigned long val = strtoul(argv[1], NULL, 16);
	if(errno)
	{
		printf("errno = %d", errno);
		exit(-1);
	}
	/*printf("val = %d (%x)\n", val, val);*/
	printf("%d.%d.%d.%d\n", val >> 24, (val & 0x00FF0000) >> 16, (val & 0x0000FF00) >> 8, val & 0x000000FF);
}
