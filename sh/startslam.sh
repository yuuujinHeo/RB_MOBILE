#!/bin/bash

while [ 1 ]
do
     pid=`ps -ef | grep "SLAMNAV" | grep -v 'grep' | awk '{print $2}'`
     if [ -z $pid ]
     then
         ~/RB_MOBILE/release/SLAMNAV
     else
         kill -9 $pid
         ~/RB_MOBILE/release/SLAMNAV
     fi
done
