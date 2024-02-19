#!/bin/bash

isAppRunning=`pgrep httpd`
if [ -n $isAppRunning];then
    service httpd stop
fi