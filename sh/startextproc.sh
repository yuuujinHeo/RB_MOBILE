#!/bin/bash

while [ 1 ]
do
     pid=`ps -ef | grep "ExtProcess" | grep -v 'grep' | awk '{print $2}'`
     if [ -z $pid ]
     then
         ~/RB_MOBILE/release/ExtProcess
     else
         kill -9 $pid
         ~/RB_MOBILE/release/ExtProcess
     fi
done
