#https://www.ibm.com/docs/en/sdk-java-technology/8?topic=support-using-diagnostic-tools


##HPROF
#HPROF is a tool that is shipped with the IBM SDK that you can use to work out which parts of a program are using the most memory or processor time.

#Using the HPROF Profiler

##HPROF is a demonstration profiler shipped with the IBM® SDK that uses the JVMTI to collect and record information about Java™ execution. You can use HPROF to work out which parts of a program are using the most memory or processor time.

##To improve the efficiency of your applications, you must know which parts of the code are using large amounts of memory and processor resources. HPROF is an example JVMTI agent and is started using the following syntax:


java -Xrunhprof[:<option>=<value>,...] <classname>