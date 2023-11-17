#!/bin/bash
pid=`ps -ef | grep "ExtProcess" | grep -v 'grep' | awk '{print $2}'`
if [ -z $pid ]
then
     echo "ExtProcess is not running"
else
     kill -9 $pid
fi
exit 0
