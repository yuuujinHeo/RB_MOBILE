#!/bin/bash

pid=`ps -ef | grep "startextproc.sh" | grep -v 'grep' | awk '{print $2}'`
if [ -z $pid ]
then
     echo "startextproc.sh is not running"
else
     kill -9 $pid
fi
pid=`ps -ef | grep "startslam.sh" | grep -v 'grep' | awk '{print $2}'`
if [ -z $pid ]
then
     echo "startslam.sh is not running"
else
     kill -9 $pid
fi

pid=`ps -ef | grep "MAIN_MOBILE" | grep -v 'grep' | awk '{print $2}'`
if [ -z $pid ]
then
     echo "MAIN_MOBILE is not running"
else
     kill -9 $pid
fi

cd ~/RB_MOBILE/release
./MAIN_MOBILE
exit 0
