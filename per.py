wsadmin.bat -lang jython -f  per.py

print "\n---------------------------------------------------------------------- "
print "Obtain the Perf MBean ObjectName，定義ObjectName為Perf MBean"
print "------------------------------------------------------------------------ "
perfName = AdminControl.completeObjectName ('type=Perf,*')
perfOName = AdminControl.makeObjectName (perfName)
print perfOName
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke getStatisticSet operation ，看目前設定"
print "------------------------------------------------------------------------ "
print AdminControl.invoke (perfName, 'getStatisticSet')
print "------------------------------------------------------------------------ \n"

#custom

print "\n---------------------------------------------------------------------- "
print "Invoke setStatisticSet operation"
print "------------------------------------------------------------------------ "
params = ['extended']

sigs  = ['java.lang.String']

print AdminControl.invoke_jmx (perfOName, 'setStatisticSet', params, sigs)
print "------------------------------------------------------------------------ \n"

#None


#對ＪＶＭ所有可以用的 狀態項目全部列出，找出需要的，記下ＩＤ，在下一步驟會用到
print "\n---------------------------------------------------------------------- "
print "Invoke getConfig operation"
print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')

params = [AdminControl.makeObjectName (jvmName)]

sigs = ['javax.management.ObjectName']

print AdminControl.invoke_jmx (perfOName, 'getConfig', params, sigs)
print "------------------------------------------------------------------------ \n"

#把perfName放到String
print "\n---------------------------------------------------------------------- "
print "Invoke getCustomSetString operation"
print "------------------------------------------------------------------------ "
print AdminControl.invoke (perfName, 'getCustomSetString')
print "------------------------------------------------------------------------ \n"

#這一步把 需要的資訊 invoke進來，特別注意 由上一步ID的內容為何，找出要的在jvmRuntimeModule做修改
print "\n---------------------------------------------------------------------- "
print "Invoke setCustomSetString operation"
print "------------------------------------------------------------------------ "
params = ['jvmRuntimeModule=1,2,3,4,5', java.lang.Boolean ('false')]

sigs  = ['java.lang.String', 'java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'setCustomSetString', params, sigs)
print "------------------------------------------------------------------------ \n"


#None

#這段就是我們要的資訊 FreeMemory UsedMemory UpTime ProcessCpuUsage
print "\n---------------------------------------------------------------------- "
print "Invoke getStatsObject operation"
print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')

params = [AdminControl.makeObjectName (jvmName), java.lang.Boolean ('false')]

sigs = ['javax.management.ObjectName', 'java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'getStatsObject', params, sigs)
print "------------------------------------------------------------------------ \n"
#＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃
