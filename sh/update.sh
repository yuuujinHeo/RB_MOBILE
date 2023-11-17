#!/bin/bash

for file in $HOME/RB_MOBILE/temp/update/*
do
    if [ -d $file ]
    then
        echo "$file is directory"
        
    elif [ -f $file ]
    then
        echo "$file is file"
        
	pid=`ps -ef | grep $(basename $file) | grep -v 'grep' | awk '{print $2}'`

	
	if [ -z $pid ]
	then
	     echo $(basename $file) " is not running"
	else
	     kill -9 $pid
	fi
	
	ext=$(basename $file)
	if [ ${ext#*.} = "sh" ]
	then
	    cp -f $file $HOME/RB_MOBILE/sh/$(basename $file)
	else
            cp -f $file $HOME/RB_MOBILE/release/$(basename $file)
            chmod +x $HOME/RB_MOBILE/release/$(basename $file)
	fi

    fi
    
done

    
pid=`ps -ef | grep "autostart.sh" | grep -v 'grep' | awk '{print $2}'`
if [ -z $pid ]
then
     echo "autostart.sh is not running"
else
     kill -9 $pid
fi

cd ~/RB_MOBILE/sh/
./autostart.sh
exit 0
