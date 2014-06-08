#!/bin/sh

ip=$(ipconfig getifaddr en0)
echo "My current ip - $ip"
echo ""

if [ $# -eq 0 ]
  then
    echo "Pass ip as an argument"
    echo "Ex: ssync.sh arg1"
    exit
fi

echo "Is synergyc running ?"
echo "---------------------"

ps_count=$(ps -ef | grep -i synergyc | grep -v grep |  wc -l)
echo "$ps_count" | tr -d ' '
echo "--"

if [ $ps_count -gt 0 ]
  then 
    echo "Yes! synergyc is currently running"
    exit
  else
    echo "Not Really!!! Boo... Starting synergyc..."
    ps -ef | grep -i "screen -s synergy" | grep -v grep
    screen -dmS synergy bash -c "synergyc -f $1"
fi

