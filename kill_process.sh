#!/bin/sh
# Lists the processes / pids  to be killed and kills them.

# Ex: ./kill_process.sh screensaver
# This is argument to kill_process: screensaver

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit
fi

echo "Here is the list of ps that needs to be killed:"
echo "-----------------------------------------------"
ps -ef | grep -i $1 | grep -v grep

echo ""
echo "Here are the pids to be deleted:"
echo "-----------------------------------------------"
ps -ef | grep -i $1 | grep -v grep | awk '{print $2}'

echo ""
ps -ef | grep -i $1 | grep -v grep | awk '{print $2}' | xargs kill
echo "Killed the pids. You should be good now!"

