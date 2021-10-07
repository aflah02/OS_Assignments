#include <stdio.h>
#include <stdlib.h>

int main(int argc,char* argv[])
{
    FILE *src;
    FILE *dest;
    char fileContentCopyingVar;
    src = fopen(argv[1], "rb");
    dest = fopen(argv[2], "wb");
    char* sourcefilename = argv[1];
    char* destinationfilename = argv[2];
    if (src == NULL){
        printf("\n No Such Source file is Present %s, Please use a valid File Name \n", sourcefilename);
        exit(0);
    }
    if (dest == NULL)
    {
        printf("\n No Such Destination file is Present %s, Please use a valid File Name \n", destinationfilename);
        exit(0);
    }
    while(fread(&fileContentCopyingVar,sizeof(fileContentCopyingVar),1,src)){
        fwrite (&fileContentCopyingVar, sizeof(fileContentCopyingVar), 1, dest);
    }
    fclose(src);
    fclose(dest);
    printf("File Contents Successfully Transferred from %s to %s\n", sourcefilename, destinationfilename);
    return 0;
}