#定義perf

perfName = AdminControl.completeObjectName ('type=JVM,*')
perfOName = AdminControl.makeObjectName (perfName)
#print perfOName



#看perf的目前設定
#print AdminControl.invoke (perfName, 'getStatisticSet')
#print "------------------------------------------------------------------------ \n"

#custom

#把perf 定義"extented"   設定輸出 為 "java.lang.String'"
#print "\n---------------------------------------------------------------------- "
#print "Invoke setStatisticSet operation"
#print "------------------------------------------------------------------------ "
params = ['extended']

sigs  = ['java.lang.String']

#print AdminControl.invoke_jmx (perfOName, 'setStatisticSet', params, sigs)
#print "------------------------------------------------------------------------ \n"

#None


#對ＪＶＭ所有可以用的 狀態項目全部列出，找出需要的，記下ＩＤ，在下一步驟會用到
#print "\n---------------------------------------------------------------------- "
#print "Invoke getConfig operation"
#print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')
#jvmName = AdminControl.completeObjectName('type=JVM,process=server1,*')






#jvmName = AdminControl.completeObjectName ('type=Server,name=server1,node=LAICHIENFU3674Node01,*')

params = [AdminControl.makeObjectName (jvmName)]

sigs = ['javax.management.ObjectName']

print AdminControl.invoke_jmx (perfOName, 'getConfig', params, sigs)
#print "------------------------------------------------------------------------ \n"

#把perfName放到String
#print "\n---------------------------------------------------------------------- "
#print "Invoke getCustomSetString operation"
#print "------------------------------------------------------------------------ "
print AdminControl.invoke (perfName, 'getCustomSetString')
#print "------------------------------------------------------------------------ \n"

#這一步把 需要的資訊 invoke進來，特別注意 由上一步ID的內容為何，找出要的在jvmRuntimeModule做修改
#print "\n---------------------------------------------------------------------- "
#print "Invoke setCustomSetString operation"
#print "------------------------------------------------------------------------ "
params = ['jvmRuntimeModule=1,2,3,4,5,17', java.lang.Boolean ('false')]

sigs  = ['java.lang.String', 'java.lang.Boolean']

#print AdminControl.invoke_jmx (perfOName, 'setCustomSetString', params, sigs)
#print "------------------------------------------------------------------------ \n"


#None

#這段就是我們要的資訊 FreeMemory UsedMemory UpTime ProcessCpuUsage
#print "\n---------------------------------------------------------------------- "
#print "Invoke getStatsObject operation"
#print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')


params = [AdminControl.makeObjectName (jvmName), java.lang.Boolean ('false')]

sigs = ['javax.management.ObjectName', 'java.lang.Boolean']

print AdminControl.invoke_jmx (perfOName, 'getStatsObject', params, sigs)
#print "------------------------------------------------------------------------ \n"
#＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃＃

#print "\n---------------------------------------------------------------------- "
#print "Invoke getInstrumentationLevelString operation"
#print "------------------------------------------------------------------------ "
#print AdminControl.invoke (perfName, 'getInstrumentationLevelString')
#print "------------------------------------------------------------------------ \n"

#PMI 層次字串可以如同 pmi=level（其中 level 是 n、l、m、h 或 x）
#The PMI specification levels include: none, basic, extended, all, or custom
#設定為最大 X
#print "\n---------------------------------------------------------------------- "
#print "Invoke setInstrumentationLevel operation - enable/disable PMI counters "
#print "------------------------------------------------------------------------ "
params = ['pmi=h', java.lang.Boolean ('true')]

sigs = ['java.lang.String', 'java.lang.Boolean']

#print AdminControl.invoke_jmx (perfOName, 'setInstrumentationLevel', params, sigs)
#print "------------------------------------------------------------------------ \n"


#print "\n---------------------------------------------------------------------- "
#print "Invoke getStatsString(ObjectName, Boolean) operation"
#print "------------------------------------------------------------------------ "
jvmName = AdminControl.completeObjectName ('type=JVM,*')

params = [AdminControl.makeObjectName (jvmName), java.lang.Boolean ('true')]

sigs = ['javax.management.ObjectName', 'java.lang.Boolean']

#print AdminControl.invoke_jmx (perfOName, 'getStatsString', params, sigs)
#print "------------------------------------------------------------------------ \n"


#print "\n---------------------------------------------------------------------- "
#print "Invoke getStatsString (ObjectName, String, Boolean) operation"
#print "------------------------------------------------------------------------ "
#mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=wcsNode,*')
#
mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=LAICHIENFU3674Node01,*')
params = [AdminControl.makeObjectName (mySrvName),'beanModule',java.lang.Boolean ('true')]

sigs = ['javax.management.ObjectName','java.lang.String','java.lang.Boolean']

#print AdminControl.invoke_jmx (perfOName, 'getStatsString', params, sigs)
#print "------------------------------------------------------------------------ \n"


#print "\n---------------------------------------------------------------------- "
#print "Invoke listStatMemberNames operation"
#print "------------------------------------------------------------------------ "
#mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=wcsNode,*')
mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=LAICHIENFU3674Node01,*')

params = [AdminControl.makeObjectName (mySrvName)]

sigs = ['javax.management.ObjectName']

print AdminControl.invoke_jmx (perfOName, 'listStatMemberNames', params, sigs)
print "------------------------------------------------------------------------ \n"


#mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=wcsNode,*')


mySrvName = AdminControl.completeObjectName ('type=Server,name=server1,node=LAICHIENFU3674Node01,*')
params = [AdminControl.makeObjectName (mySrvName)]

sigs = ['javax.management.ObjectName']

print AdminControl.invoke_jmx (perfOName, 'listStatMemberNames', params, sigs)