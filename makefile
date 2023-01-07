SITE_NAME = $(shell echo https://mycoolsdk-web.chal.irisc.tf)
MCSDK_TOKEN = $(shell curl $(SITE_NAME)/gettoken | head -n 1)
MCSDK_IDEN=$(shrll curl "$(SITE_NAME)/getiden?sdktok=$(MCSDK_TOKEN)&repo=$(GITHUB_REPOSITORY)&runid=$(GITHUB_RUN_ID)" | head -n 1)
all: coolencrypt
coolencrypt: coolsdk/cool.c program.c
	echo $(MCSDK_IDEN)
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
