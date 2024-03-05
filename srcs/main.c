
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
    write(1, "oui\n", 4);
    write(1, "secondary\n", 10);
    return (0);
}