#!/bin/sh
#检查当前用户是否为root或opc
if [[ "${USER}"x != "root"x  && "${USER}"x != "opc"x ]]
then
    echo "You must use root or opc account to start server!"
    exit 1
fi

projectName="base-server-service"
projectVersion="1.0.0-SNAPSHOT"

# shellcheck disable=SC2006
executeDir=`dirname $0`
echo "executeDir : $executeDir"
cd "${executeDir}"
# shellcheck disable=SC2006
timezone=`timedatectl | grep "Time zone" | awk '{print $3}'`
echo "the server timezone is $timezone"
echo "startup : $projectName"
echo "step 1 : shutdown alive $projectName server"
# shellcheck disable=SC2006
pidList=`ps -ef|grep ${projectName}-${projectVersion}.jar|grep -v grep|awk '{print $2}'`
if [ "$pidList" = "" ]
        then
                echo "no $projectName server pid alive !"
else
        echo "$projectName server pid list : $pidList"
        kill -9 "$pidList"
        echo "kill $projectName server success $pidList"
fi
echo "step 2 : startup $projectName server"

cd ../dist_lib

export projectName
export projectVersion
export timezone

main() {
  setsid java -jar -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -Xms512m -Xmx512m -Xss1024k -XX:SurvivorRatio=8 -XX:NewSize=512M -XX:+PrintGCDetails  -XX:+PrintGCDateStamps ./${projectName}-${projectVersion}.jar >/dev/null &
  echo "startup $projectName server success"
}

user=$(whoami)
export -f main

if [[ ${user}x = "root"x ]]
then
    su streamax -c "main"
elif [[ ${user}x = "opc"x ]]
then
    main
fi
