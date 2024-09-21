#include <stdio.h>

int array[100];

int main() {
    int n; //r8d

    printf("Enter the number of elements in the array: ");
    scanf("%d", &n);

    int i = 0; //ecx
    printf("Enter the array elements:\n");

cycle1_start:
    if (i == n) goto cycle1_end;
    scanf("%d", &array[i]);
    i += 1;
    goto cycle1_start;
cycle1_end:

    int j = 0; //r9d
    i = 0;

    int m = n - 1; //r10d

    int k;  //r12d
    int temp;

cycle2_start:
    if (i == m) goto cycle2_end;
    j = 0;
    k = m - i;
    goto cycle3_start;
cycle3_start:
    if (j == k) goto cycle3_end;
    if (array[j] <= array[j + 1]) goto no_swap;
    temp = array[j];
    array[j] = array[j + 1];
    array[j + 1] = temp;

no_swap:
    j += 1;
    goto cycle3_start;
cycle3_end:
   i += 1;
   goto cycle2_start;
cycle2_end:

    i = 0;

cycle4_start:
    if (i == n) goto cycle4_end;
    printf("%d ", array[i]);
    i += 1;
    goto cycle4_start;
cycle4_end:

    return 0;
}
