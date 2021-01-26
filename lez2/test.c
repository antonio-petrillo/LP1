#include <stdio.h>


int main(){
	int x = 3, y = 2;
	printf("x := %d, y := %d\n", x, y);
	{
		x = 4;
		printf("x := %d, y := %d\n", x, y);
	}
	printf("x := %d, y := %d\n", x, y);
	return 0;
}
