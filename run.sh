#!/bin/bash

while true; do
	if ! pgrep "insync-portable" >/dev/null 2>&1 ; then
		echo "`date`: Starting insync-portable"
		/app/insync-portable/insync-portable start
	fi
done
