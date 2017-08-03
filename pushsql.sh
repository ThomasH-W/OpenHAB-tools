#!/bin/bash
SQL_SERVER="192.168.1.2"
SQL_USER="sqlusername"
SQL_PASSWORD="sqlpassword"
SQL_DB="sqldbname"
MSG_BODY="11.1 22.2 23 24 25 26"
VERBOSE_LEVEL=0

ERR_NONE=0

# error handler
printUsage() {
   echo "Usage: pushsql.sh [-v|--verbose] [-H|--host <host>] [-u|--username <user>] [-p|--password [-d|--database <database>] <message> "
   echo "examples"
   echo './pushsql.sh 11.9 22 23 24 25 26 27 28'
   echo './pushsql.sh -H "localhost" 11.9 22 23 24 25 26 27 28'
   echo 'Fields: Aussen, Wintergarten, Zimmer, Terrasse, Pool, WW_Speicher, Vorlauf, Ruecklauf'
   exit ${ERR_NONE}
}

# check if parameter has been provided
case $1 in
-v|--verbose)
	VERBOSE_LEVEL=1
	shift
	;;
esac

case $1 in
-H|--host)
	case $2 in
	"")
		printUsage
		;;
	*)
		SQL_SERVER=$2
		echo "set host:" $SQL_SERVER
		shift
		shift
		;;
	esac
	;;
esac

# check if parameter has been provided
case $1 in
-u|--username)
	case $2 in
	"")
		printUsage
		;;
	*)
		SQL_USER=$2
		if [[ $VERBOSE_LEVEL != 0 ]]; then
			echo "set user:" $SQL_USER
		fi
		shift
		shift
		;;
	esac
	;;
esac

# check if parameter has been provided
case $1 in
-p|--password)
	case $2 in
	"")
		printUsage
		;;
	*)
		SQL_PASSWORD=$2
		if [[ $VERBOSE_LEVEL != 0 ]]; then
			echo "set password:" $SQL_PASSWORD
		fi
		shift
		shift
		;;
	esac
	;;
esac

# check if parameter has been provided
case $1 in
-d|--database)
	case $2 in
	"")
		printUsage
		;;
	*)
		SQL_DB=$2
		if [[ $VERBOSE_LEVEL != 0 ]]; then
			echo "set database:" $SQL_DB
		fi
		shift
		shift
		;;
	esac
	;;
esac

# check if parameter has been provided
case $8 in
	"")
		printUsage
		;;
esac

# table	avrdat
# fields: Aussen, Wintergarten, Zimmer, Terrasse, Pool, WW_Speicher, Vorlauf, Ruecklauf


QUERY="INSERT INTO avrdat (Aussen, Wintergarten, Zimmer, Terrasse, Pool, WW_Speicher, Vorlauf, Ruecklauf) VALUES ('$1','$2','$3','$4','$5','$6','$7','$8')"
if [[ $VERBOSE_LEVEL != 0 ]]; then
	echo "sql:" $QUERY
fi

# mysql -h 192.168.178.72 -u root --password=nxt2008 --database avrio
# echo "sql:" mysql -h $SQL_SERVER -u $SQL_USER --password=$SQL_PASSWORD --database $SQL_DB 

if [[ $8 ]];then
  echo $QUERY | mysql -h $SQL_SERVER -u $SQL_USER --password=$SQL_PASSWORD --database $SQL_DB 
  rc=$?
  if [[ $rc != 0 ]]; then 
	echo "sql:" $QUERY
    echo "SQL ERROR"
	exit $rc
  else
    echo "SQL ok"
	exit 0
  fi
fi

