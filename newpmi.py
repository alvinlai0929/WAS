set perfName [$AdminControl completeObjectName type=Perf,*]
#set perfName [$AdminControl completeObjectName type=JVM,process=server1,*]

set jvm [$AdminControl completeObjectName type=JVM,process=server1,*]

set perfOName [$AdminControl makeObjectName $perfName]

$AdminControl invoke $perfName getStatisticSet

 set params [java::new {java.lang.Object[]} 1]
 $params set 0 [java::new java.lang.String extended]
 set sigs  [java::new {java.lang.String[]} 1]
 $sigs set 0 java.lang.String
 $AdminControl invoke_jmx $perfOName setStatisticSet $params $sigs

set jvmName [$AdminControl completeObjectName type=JVM,*]

set params [java::new {java.lang.Object[]} 1]
$params set 0 [java::new javax.management.ObjectName $jvmName]
set sigs  [java::new {java.lang.String[]} 1]
$sigs set 0 javax.management.ObjectName

$AdminControl invoke_jmx $perfOName getConfig $params $sigs

$AdminControl invoke $perfName getCustomSetString


set params [java::new {java.lang.Object[]} 2]
$params set 0 [java::new java.lang.String jvmRuntimeModule=1,2,3,5,11,13,17]
$params set 1 [java::new java.lang.Boolean false]

set sigs  [java::new {java.lang.String[]} 2]
$sigs set 0 java.lang.String
$sigs set 1 java.lang.Boolean

$AdminControl invoke_jmx $perfOName setCustomSetString $params $sigs


 set jvmName [$AdminControl completeObjectName type=JVM,*]
set params [java::new {java.lang.Object[]} 2]
 $params set 0 [java::new javax.management.ObjectName $jvmName]
 $params set 1 [java::new java.lang.Boolean false]
 set sigs  [java::new {java.lang.String[]} 2]
 $sigs set 0 javax.management.ObjectName
 $sigs set 1 java.lang.Boolean
 $AdminControl invoke_jmx $perfOName getStatsObject $params $sigs


$AdminControl invoke $perfName getInstrumentationLevelString



#指定server1 中的jvm 為 jvm
# set jvm [$AdminControl completeObjectName type=JVM,process=server1,*]