print "\n---------------------------------------------------------------------- "
print "Obtain the Perf MBean ObjectName"
print "------------------------------------------------------------------------ "
perfName = AdminControl.completeObjectName ('type=Perf,*')
perfOName = AdminControl.makeObjectName (perfName)
print perfOName
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke getStatisticSet operation "
print "------------------------------------------------------------------------ "
print AdminControl.invoke (perfName, 'getStatisticSet')
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke setStatisticSet operation"
print "------------------------------------------------------------------------ "
params = ['extended']

sigs  = ['java.lang.String']

print AdminControl.invoke_jmx (perfOName, 'setStatisticSet', params, sigs)
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke getConfig operation"
print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')

params = [AdminControl.makeObjectName (jvmName)]

sigs = ['javax.management.ObjectName']

print AdminControl.invoke_jmx (perfOName, 'getConfig', params, sigs)
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke getCustomSetString operation"
print "------------------------------------------------------------------------ "
print AdminControl.invoke (perfName, 'getCustomSetString')
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke setCustomSetString operation"
print "------------------------------------------------------------------------ "
params = ['jvmRuntimeModule=1,2,3,4', java.lang.Boolean ('false')]

sigs  = ['java.lang.String', 'java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'setCustomSetString', params, sigs)
print "------------------------------------------------------------------------ \n"

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

print "\n---------------------------------------------------------------------- "
print "Invoke getInstrumentationLevelString operation"
print "------------------------------------------------------------------------ "
print AdminControl.invoke (perfName, 'getInstrumentationLevelString')
print "------------------------------------------------------------------------ \n"

#PMI 層次字串可以如同 pmi=level（其中 level 是 n、l、m、h 或 x）
#The PMI specification levels include: none, basic, extended, all, or custom
#設定為最大 X
print "\n---------------------------------------------------------------------- "
print "Invoke setInstrumentationLevel operation - enable/disable PMI counters "
print "------------------------------------------------------------------------ "
params = ['pmi=h', java.lang.Boolean ('true')]

sigs = ['java.lang.String', 'java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'setInstrumentationLevel', params, sigs)
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke getStatsString(ObjectName, Boolean) operation"
print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')

params = [AdminControl.makeObjectName (jvmName), java.lang.Boolean ('true')]

sigs = ['javax.management.ObjectName', 'java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'getStatsString', params, sigs)
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke getStatsString (ObjectName, String, Boolean) operation"
print "------------------------------------------------------------------------ "
#mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=wcsNode,*')
#
mySrvName = AdminControl.completeObjectName ('type=Server,name=TBB_APserver,node=TBB_WMSNode,*')
params = [AdminControl.makeObjectName (mySrvName),'beanModule',java.lang.Boolean ('true')]

sigs = ['javax.management.ObjectName','java.lang.String','java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'getStatsString', params, sigs)
print "------------------------------------------------------------------------ \n"


print "\n---------------------------------------------------------------------- "
print "Invoke listStatMemberNames operation"
print "------------------------------------------------------------------------ "
#mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=wcsNode,*')
mySrvName = AdminControl.completeObjectName ('type=Server,name=TBB_APserver,node=TBB_WMSNode,*')

params = [AdminControl.makeObjectName (mySrvName)]

sigs = ['javax.management.ObjectName']

print AdminControl.invoke_jmx (perfOName, 'listStatMemberNames', params, sigs)
print "------------------------------------------------------------------------ \n"