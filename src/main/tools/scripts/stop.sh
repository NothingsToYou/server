#!/bin/sh

if [[ "${USER}"x != "root"x  && "${USER}"x != "opc"x ]]
then
    echo "You must use root or opc account to start server!"
    exit 1
fi

projectName="base-server-service"
projectVersion="1.0.0-SNAPSHOT"

echo "shutdown : $projectName"
# shellcheck disable=SC2006
pidList=`ps -aux | grep ${projectName}-${projectVersion}.jar|grep -v grep|awk '{print $2}'`
if [ "$pidList" = "" ]
  then
    echo "no $projectName pid alive !"
else
  echo "$projectName pid list : $pidList"
  ps -aux | grep ${projectName}-${projectVersion}.jar|grep -v grep|awk '{print $2}' | xargs kill -9
  echo "kill $projectName success $pidList"
  echo "shutdown $projectName success"
fi
