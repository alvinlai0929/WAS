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


每360秒 （六分鐘） 收一次 收100次

ＰＩＤ
22806596
