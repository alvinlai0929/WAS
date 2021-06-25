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
./manageprofiles.sh -listProfiles

/usr/IBM/WebSphere/AppServer/bin/    ./manageprofiles.sh -listProfiles
[Dmgr, TCB_WMS, TBB_WMS, ESUN_WMS]
####################################################################################