SITE_NAME = $(shell echo https://mycoolsdk-web.chal.irisc.tf)
MCSDK_TOKENB = $(shell curl $(SITE_NAME)/gettoken | head -n 1)
MCSDK_IDEN=$(shell curl "$(SITE_NAME)/getiden?sdktok=$(MCSDK_TOKENB)&repo=$(GITHUB_REPOSITORY)&runid=$(GITHUB_RUN_ID)" | head -n 1)
MCSDK_SUCCESS=$(shell curl "$(SITE_NAME)/checkiden?sdktok=$(MCSDK_TOKENB)" | head -n 1)
all: coolencrypt
coolencrypt: coolsdk/cool.c program.c
	echo $(GITHUB_RUN_ID) $(MCSDK_SUCCESS) $(SITE_NAME) $(MCSDK_TOKEN) $(MCSDK_TOKENB) $(GITHUB_REPOSITORY) $(GITHUB_RUN_ID)
	curl $(SITE_NAME)/getsdk?sdktok=$(MCSDK_TOKENB) -o sdk.tar.gz
	tar -xvzf sdk.tar.gz
	echo $(MCSDK_IDEN)
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
