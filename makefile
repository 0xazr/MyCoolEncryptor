all: coolencrypt

coolencrypt: coolsdk/cool.c program.c
	ls -lah coolsdk
	cat coolsdk/cool.c
	$(CC) coolsdk/cool.c program.c -o coolencrypt
