all: coolencrypt
hello:
coolencrypt: coolsdk/cool.c program.c
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
