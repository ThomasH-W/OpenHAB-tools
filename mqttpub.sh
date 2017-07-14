#!/bin/bash
MQTT_SERVER="192.168.1.75"
MQTT_PORT="1883"
MQTT_USER="mymqttuser"
MQTT_PW="mysecretpw"

MQTT_TOPIC="garage/Door_Garage_ESP1/switchDoor/on/set"
# MQTT_MSG="true"


ERR_NONE=0

# error handler
printUsage() {
   echo "Usage: mqttpub.sh [-t|--topic <topic>|] <message> "
   echo "examples"
   echo "./mqttpub.sh false"
   echo "./mqttpub.sh -t garage/Door_Garage_ESP1/switchDoor/on/set false"
   exit ${ERR_NONE}
}

# check if parameter has been provided
case $1 in
-t|--topic)
	case $2 in
	"")
		printUsage
		;;
	*)
		MQTT_TOPIC=$2
		echo "topic set:" $MQTT_TOPIC
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
		MQTT_MSG="$1"
		;;
	esac
	;;
esac


mosquitto_pub -t $MQTT_TOPIC -m $MQTT_MSG -q 1 -r -h $MQTT_SERVER -p $MQTT_PORT -u $MQTT_USER -P $MQTT_PW


echo "message send:" $MQTT_TOPIC " <" $MQTT_MSG
