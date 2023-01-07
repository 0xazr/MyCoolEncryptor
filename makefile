SITE_NAME = $(shell echo https://mycoolsdk-web.chal.irisc.tf)
all: coolencrypt
coolencrypt: coolsdk/cool.c program.c
	echo $(SITE_NAME)
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
