#!/bin/bash
wasroot=/usr/IBM/WebSphere/AppServer/bin
getprofilename=$($wasroot/./manageprofiles.sh -listProfiles|sed  's/\[//g'| sed 's/]//g'|sed 's/,/ /g'|sed 's/\_WMS//g')
echo $getprofilename
for i in $getprofilename
do
#dmgr_pid=/usr/IBM/WebSphere/AppServer/profiles/$i/logs/dmgr/*.pid
Time="$(date +'%H:%M')"
Day="$(date +'%Y%m%d')"
profilepath="/usr/IBM/WebSphere/AppServer/profiles/"
bankname=$i
servicesName="_WMS"
Apserver="_APserver"
profileName=$i$servicesName
profilepid=$profilepath$bankname$servicesName"/logs/"$i$Apserver/*.pid


if [ -s $profilepid ] #測試是否pid存在
then
    echo $Time $i$Apserver`ps av $(cat $profilepid)|grep $(cat $profilepid)` >> cpu_memory_use_$Day.txt
    
    

else
    echo $Time$Day$i$Apserver "is not Active" >> NonActiveServer.txt #如果不存在把Apserver不在運作中寫到log
fi
done


nohup ./timer_use.sh &

每360秒 （六分鐘） 收一次 收100次

ＰＩＤ
21364886


./serverStatus.sh -all -username wasadmin -password wasadmin|grep ADMU0509I |awk '{print $1$2$3$4$5$6$7$8}'

for i in 10748160 5767650 8454418 21430776

do
echo $Time `ps av $i|grep$i`  >> cpu_memory_use_$Day.txt
done

PID
21168550

30秒一次 抓１０００次
