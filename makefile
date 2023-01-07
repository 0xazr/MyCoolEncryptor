all: coolencrypt

coolencrypt: coolsdk/cool.c program.c
	cat coolsdk/cool.c
	$(CC) coolsdk/cool.c program.c -o coolencrypt
