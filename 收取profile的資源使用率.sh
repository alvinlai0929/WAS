#!bin/ksh

##完成測試與抓取資源使用###############################################################
TBBprofile=/usr/IBM/WebSphere/AppServer/profiles/TBB_WMS

TBBpid=/logs/TBB_APserver/TBB_APserver.pid
#TBBnodepid=/logs/nodeagent/nodeagent.pid

if [ -s $TBBprofile$TBBpid ]
then
    ps av `cat $TBBprofile$TBBpid`

else
    echo $TBBprofile$TBBpid "is not exit"
fi
##完成###############################################################################
./manageprofiles.sh -listProfiles #列出profile
profiles\AppSrv1\bin>serverStatus.sh -all #列出servers

/usr/IBM/WebSphere/AppServer/bin/    ./manageprofiles.sh -listProfiles
[Dmgr, TCB_WMS, TBB_WMS, ESUN_WMS]
####################################################################################
##########################排除符號##########################################################
./manageprofiles.sh -listProfiles|sed  's/\[//g'| sed 's/]//g'| sed 's/ //g' |sed 's/,/ /g'
Dmgr TCB_WMS TBB_WMS ESUN_WMS

##########################排除符號##########################################################

##########################排除_WMS與符號####################################################
./manageprofiles.sh -listProfiles|sed  's/\[//g'| sed 's/]//g'|sed 's/,/ /g'|sed 's/\_WMS//g'
Dmgr  TCB  TBB  ESUN
##########################排除_WMS與符號####################################################


#依照找到的profile 去 was root/profiles/$ /logs/servers ,/nodeagents ,找*.pid
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
    echo $Time`ps av $(cat $profilepid)|grep $(cat $profilepid)` >> cpu_memory_use_$Day.txt
    
    

else
    echo $Time$Day$i$Apserver "is not Active" >> NonActiveServer.txt #如果不存在把Apserver不在運作中寫到log
fi
done



#########################################################################################################


#echo $Time$used_MEM_CPU >> cpu_memory_$Day#如果存在把pid列出來

serverName=

apserver_pid=/usr/IBM/WebSphere/AppServer/profiles/$i/logs//*.pid



TBBprofile=/usr/IBM/WebSphere/AppServer/profiles/TBB_WMS

TBBpid=/logs/TBB_APserver/TBB_APserver.pid

#TBBnodepid=/logs/nodeagent/nodeagent.pid

if [ -s $TBBprofile$TBBpid ] #測試是否pid存在
then
    ps av `cat $TBBprofile$TBBpid` #如果存在把pid列出來

else
    echo $TBBprofile$TBBpid "is not exit" #如果不存在把pid的檔案列出來，不存在
fi
