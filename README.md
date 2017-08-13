# OpenHAB tools

mqttpub.sh
  Simple script to publish messages to the MQTT broker
  Usage: mqttpub.sh [-t|--topic <topic>|] <message> "
  Example: mqttpub.sh -t home/433/arduino1/temperature 22.3
  Broker details are configured in the script

pushbullet.sh
  Send message to the pushbullet server
  usage: pushbullet.sh [-t|--title <title>|] <message
  Example: ./pushbullet.sh -t Alarm "window broken"     
                                                      
pushsql.sh
  Insert data into sql database
  Usage: pushsql.sh [-v|--verbose] [-H|--host <host>] [-u|--username <user>] [-p|--password [-d|--database <database>] <message>
  Example: ./pushsql.sh -H "localhost" 11.9 22.3 23 24 25 26 27 28
  
