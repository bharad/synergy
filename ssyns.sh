#!/bin/bash

# HOME is the path where synergy.conf is stored.
# It needs to be passed as the first argument.
HOME=$1
echo ""
echo "Is Synergy Server Running ?"
echo "---------------------------"
number=$(ps -ef | grep "synergys -c" | grep -v grep | wc -l)

# kill the existing pid and restart synergy server
# The "X" either side of the equals sign allows for either $str1 or $str2 to be empty strings.
# Afaik the "==" is only valid in bash shell. Use "=" instead.
# The "-eq" operator only applies to numbers not strings.
if  [ "$2" = "kill" ]
then
  echo "Let me check..."
  echo ""
  pid=$(ps -ef | grep synergys | grep -v grep | awk '{print $2}')
  if [ "$pid" != "" ] && [ "$pid" -gt 0 ]
  then
    echo "I guess yes, but we are gonna kill it !"
    echo "Deleting the following pids"
    echo $pid
    echo "--"
    kill $pid
    echo "Restarting Synergy server..."
    synergys -c "$HOME/synergy.conf"
  else
    echo "Synergys was not running"
  fi
# synergy server is already running
elif [ $number -gt 0 ]
then
  echo $number
  echo "--"
  echo "Yes!, Synergy server is currently running..."
# starting synergy server since it's not running
else
  echo "Not Really!!! Starting Synergy Server..."
  synergys -c "$HOME/synergy.conf"
fi

