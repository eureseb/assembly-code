#include <stdio.h>
#include <math.h>
#include <string.h>
#include <ctype.h>


void decToBin(int);
void decToHex(int);
int hexToDec(char*);
int binToDec(long long int);

int main(){
    // int dec = 1998;
     char hex[] = "74E";
    long long int bin = 11111001110;
	// decToHex(dec);
	// printf("\n");
	//decToHex(90);
	printf("\n%d",binToDec(bin));
	//printf("\n%d",hexToDec(hex));
    return 0;
}

void decToHex(int dec){
    int n = dec;
    int count = 0,base=16,temp;
    int stack[16] = {0}; 

    while(n != 0){
        temp = n % base;
        stack[count] = temp;
        count++;
        n /= base;
    }
    while(count != 0){
        temp = stack[count-1];
        if(temp > 9) temp += 7;
        printf("%c",48+temp);
        count--;
    }

}
void decToBin(int dec){
    int n = dec;
    int count = 0,base=2,temp;
    int stack[16] = {0}; 

    while(n != 0){
        temp = n % base;
        stack[count] = temp;
        count++;
        n /= base;
    }
    while(count != 0){
        temp = stack[count-1];
        printf("%c",48+temp);
        count--;
    }

}

int binToDec(long long int n){
	int dec = 0; 
    int i=0,j,temp;
	
    while(n){
        temp = n % 10;
        n /= 10;
        dec += temp * pow(2,i++);
    }
    return dec;
}
int hexToDec(char hex[]){
    char c;
	int dec = 0;
	int i, temp;
	int len = strlen(hex) - 1;
	for(i=0; hex[i]!='\0'; i++){
		c = hex[i];
		if(isdigit(c))
            temp = c - 48;
		else if(islower(c))
            temp = c - 'a' + 10;
		else if(isupper(c))
            temp = c - 'A' + 10;
		
		dec += temp * pow(16, len--); //dec = temp * 16^length; i--;
	}
	return dec;
}