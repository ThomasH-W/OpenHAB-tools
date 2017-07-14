#!/bin/bash
API_KEY="mysecretkey"
MSG_TITLE="Alert"
MSG_BODY="hallo Welt"

ERR_NONE=0

# error handler
printUsage() {
   echo "Usage: pushbullet.sh [-t|--title <title>|] <message> "
   echo "examples"
   echo './pushbullet.sh "Hallo Welt"'
   echo './pushbullet.sh -t "my Script" "Hallo Welt"'
   exit ${ERR_NONE}
}

# check if parameter has been provided
case $1 in
-t|--title)
	case $2 in
	"")
		printUsage
		;;
	*)
		MSG_TITLE=$2
		echo "title set:" $MSG_TITLE
		shift
		shift
		;;
	esac
	;;
esac

# read next paramater from commend line
case $1 in
*)
	case $1 in
	"")
		printUsage
		;;
	*)
		MSG_BODY="$1"
		;;
	esac
	;;
esac

curl -u $API_KEY: https://api.pushbullet.com/v2/pushes -d type=note -d title=$MSG_TITLE -d body="$MSG_BODY" > curl.log 2>&1
echo "message send :" $MSG_BODY

