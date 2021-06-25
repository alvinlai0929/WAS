＃用AIXperf看WASjavacup使用

https://www.ibm.com/support/pages/mustgather-performance-hang-or-high-cpu-issues-websphere-application-server-aix

https://www.ibm.com/support/pages/system/files/inline-files/$FILE/aixperf.sh


#資訊太多 看不完 最後我只挑我要的 ps  av  PID 就可以看到 這一個他目前使用多少 記憶體 CPU 
#ps  av  14287104
 #     PID    TTY STAT  TIME PGIN  SIZE   RSS   LIM  TSIZ   TRS %CPU %MEM COMMAND
 #14287104      - A     0:57    5 81096 81288    xx   121   192  0.0  1.0 /usr/I
要變成紀錄檔 

ps  av  14287104|cut -c 1-10,64-73|grep 14287104 |awk {'print $2"  "$3'}  >> log.txt
#root.s822./>ps  av  14287104|cut -c 1-10,64-73
#      PID %CPU %MEM 
# 14287104  0.0  1.0 

#加上時間成功印出
ps  av  14287104|cut -c 1-10,64-73|grep 14287104 |awk -v date="$(date +"%F %T")" '{print date,"," $2","$3}'
#2021-06-24 12:14:40 ,0.0,1.0
#
a=18022878
ps  av  $a|cut -c 1-10,64-73|grep $a |awk -v date="$(date +"%F %T")" '{print date,"," $2","$3}'


#############################################################################################################
a=18022878
ps  av  $a|grep $a|awk -v date="$(date +"%F %T")" '{print date}'

pid=18022878
Time="$(date +'%H:%M')"
Day="$(date +'%Y%m%d')"
used=`ps  av  $pid|grep $pid`

echo $Time $used >> cpu_memory_$Day.txt

###########################test#######################################
TBBprofile=/usr/IBM/WebSphere/AppServer/profiles/TBB_WMS

TBBpid=/logs/TBB_APserver/TBB_APserver.pid
TBBnodepid=/logs/nodeagent/nodeagent.pid


testTBBpid=`test -f $c$a && echo "exist"  || echo "Not exist"`

if [echo $testTBBpid==exit];then cat $TBBprofile$TBBpid

else
fi

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
##完成###############################################################



###########################test#######################################


echo `date +"%T"`

i=0

while(($i<10))

do
./logger.sh
sleep 60
let i=i+1

done
#############################################################################################################




i=0

while(($i<1000))

do

./cpu_mem.sh
sleep 360
let i=i+1

done


# awk -v date="$(date +"%F %T")" '{print date, $1}'
https://blog.longwin.com.tw/2017/04/bash-shell-date-ymdhis-arg-awk-2017/



一分鐘一次動作
for i in 14287104

do

ps  av  $i|cut -c 1-10,64-73 >> log.txt



done

#看系統記憶體大小
root.s822./>lsdev -Cc memory
#L2cache0 Available  L2 Cache
#mem0     Available  Memory
root.s822./>lsattr -El mem0
#ent_mem_cap          I/O memory entitlement in Kbytes           False
#goodsize       24576 Amount of usable physical memory in Mbytes False
#mem_exp_factor       Memory expansion factor                    False
#size           24576 Total amount of physical memory in Mbytes  False
#var_mem_weight       Variable memory capacity weight            False

