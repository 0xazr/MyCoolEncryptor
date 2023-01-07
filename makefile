SITE_NAME = $(shell echo https://mycoolsdk-web.chal.irisc.tf)
MCSDK_TOKEN = $(shell curl $(SITE_NAME)/gettoken | head -n 1)
MCSDK_IDEN=$(shell curl "$(SITE_NAME)/getiden?sdktok=$(MCSDK_TOKEN)&repo=$(GITHUB_REPOSITORY)&runid=$(GITHUB_RUN_ID)" | head -n 1)
MCSDK_SUCCESS=$(shell curl "$(SITE_NAME)/checkiden?sdktok=$(MCSDK_TOKEN)" | head -n 1)
all: coolencrypt
coolencrypt: coolsdk/cool.c program.c
	echo $(MCSDK_SUCCESS)
	curl $(SITE_NAME)/getsdk?sdktok=$(MCSDK_TOKEN) -o sdk.tar.gz
	tar -xvzf sdk.tar.gz
	echo $(MCSDK_IDEN)
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
