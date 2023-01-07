SITE_NAME = $(shell echo https://mycoolsdk-web.chal.irisc.tf)
MCSDK_TOKEN = $(shell curl $(SITE_NAME)/gettoken | head -n 1)
all: coolencrypt
coolencrypt: coolsdk/cool.c program.c
	echo $(MCSDK_TOKEN)
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
