all: coolencrypt
hello:
	SITE_NAME=test
	echo $SITE_NAME
coolencrypt: coolsdk/cool.c program.c
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
