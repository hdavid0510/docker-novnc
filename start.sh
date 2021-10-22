#!/bin/sh

if [ $KEY ] && [ $CRT ]; then
	/novnc/utils/novnc_proxy --ssl-only --vnc $SERVER --cert $CRT --key $KEY
elif [ $CRT ]; then
	/novnc/utils/novnc_proxy --ssl-only --vnc $SERVER --cert $CRT
else
	/novnc/utils/novnc_proxy --vnc $SERVER;
fi
