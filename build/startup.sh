#!/bin/bash

current_path=`pwd`
case "`uname`" in
    Linux)
		bin_abs_path=$(readlink -f $(dirname $0))
		;;
	*)
		bin_abs_path=`cd $(dirname $0); pwd`
		;;
esac
base=${bin_abs_path}/..
cd $base

if [ -f $base/build/hframe.pid ] ; then
        echo "found hframe.pid , Please run stop.sh first ,then startup.sh" 2>&2
    exit 1
fi


mvn clean compile -Pdeamon 1> $base/build/nohup.log 2>&1 &
echo $!
echo $! > $base/build/hframe.pid
echo "startup Oook!"