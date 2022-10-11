#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* Input  */
/* char* seed: seed given as command line argument #1 (argv[1])*/
/* int key: key given as command line argument #2 (argv[2])*/

/* Output  */
/* char* serial: empty array to be filled with generated serial key */
void generate_serial(char *serial, char *seed, int key) {

  /* #################################### */
  /* ######### <Your Code Here> ######### */
  /* #################################### */
	//printf("%d\n",key);
	int index = -1, idiv,index_seed = -1;
	char seed_c,key_c;
	for(int i = 0; i<5; ++i){
		for(int l = 0; l<4; ++l){
			seed_c = seed[++index_seed];
			//printf("%c ",seed_c);
			if(isdigit(seed_c)){ // test if number 1234
				//printf("%d digit %c ",l,seed_c);
				idiv = key % 10;
				key_c = seed_c - idiv;
				if(key_c<0x30)	key_c += 10;

			}else if(isupper(seed_c)){ // test if supper ABCD
				//printf("%d upper %c ",l,seed_c);
				idiv = key % 26;
				key_c = seed_c -idiv;
				if(key_c<0x41) key_c += 26;
			}else{ //test if lower abcd
				//printf("%d lower %c ",l,seed_c);
				idiv = key % 26;
				key_c = seed_c-idiv;
				if(key_c<0x61)	key_c += 26;
			} serial[++index] = key_c;
			//printf("%c\n",key_c);
		} if(i<4) serial[++index]='-'; 
	} ;
	//printf("strlen  %ld\n",strlen(serial));
}

int main(int argc, char **argv) {
  char serial[32] = {0};
  char *seed;
  int key;

  if (argc < 3) {
    printf("Seed and Key not provided\n");
    return 1;
  }

  seed = argv[1];
  key = atoi(argv[2]);

  if (strlen(argv[1]) != 20) {
    printf("Incorrect seed format\n");
    return 1;
  }

  if (key < 17 || key > 255) {
    printf("Incorrect key format\n");
    return 1;
  }

  generate_serial(serial, argv[1], atoi(argv[2]));
  printf("%s\n", serial);
  return 0;
}
