# OpenHAB tools

mqttpub.sh<br>
  Simple script to publish messages to the MQTT broker<br>
  Usage: mqttpub.sh [-t|--topic <topic>|] <message><br>
  Example: mqttpub.sh -t home/433/arduino1/temperature 22.3<br>
  Broker details are configured in the script<br>
<br>

pushbullet.sh<br>
  Send message to the pushbullet server<br>
  usage: pushbullet.sh [-t|--title <title>|] <message<br>
  Example: ./pushbullet.sh -t Alarm "window broken"<br> 
<br>
                                                      
pushsql.sh<br>
  Insert data into sql database<br>
  Usage: pushsql.sh [-v|--verbose] [-H|--host <host>] [-u|--username <user>] [-p|--password [-d|--database <database>] <message><br>
  Example: ./pushsql.sh -H "localhost" 11.9 22.3 23 24 25 26 27 28
  
