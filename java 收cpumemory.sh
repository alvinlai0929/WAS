#https://www.ibm.com/docs/en/sdk-java-technology/8?topic=support-using-diagnostic-tools


##HPROF
#HPROF is a tool that is shipped with the IBM SDK that you can use to work out which parts of a program are using the most memory or processor time.

#Using the HPROF Profiler

##HPROF is a demonstration profiler shipped with the IBM® SDK that uses the JVMTI to collect and record information about Java™ execution. You can use HPROF to work out which parts of a program are using the most memory or processor time.

##To improve the efficiency of your applications, you must know which parts of the code are using large amounts of memory and processor resources. HPROF is an example JVMTI agent and is started using the following syntax:




java -Xrunhprof[:<option>=<value>,...] <classname>

The command java -Xrunhprof:help shows the options available:

heap=dump|sites|all
This option helps in the analysis of memory usage. It tells HPROF to generate stack traces, from which you can see where memory was allocated. If you use the heap=dump option, you get a dump of all live objects in the heap. With heap=sites, you get a sorted list of sites with the most heavily allocated objects at the start. The default value all gives both types of output.
cpu=samples|times|old
The cpu option provides information that is useful in determining where the processor spends most of its time. If cpu is set to samples, the JVM pauses execution and identifies which method call is active. If the sampling rate is high enough, you get a good picture of where your program spends most of its time. If cpu is set to times, you receive precise measurements of how many times each method was called and how long each execution took. Although this option is more accurate, it slows down the program. If cpu is set to old, the profiling data is produced in the old HPROF format.
interval=y|n
The interval option applies only to cpu=samples and controls the time that the sampling thread sleeps between samples of the thread stacks.
monitor=y|n
The monitor option can help you understand how synchronization affects the performance of your application. Monitors implement thread synchronization. Getting information about monitors can tell you how much time different threads are spending when trying to access resources that are already locked. HPROF also gives you a snapshot of the monitors in use. This information is useful for detecting deadlocks.
format=a|b
The default for the output file is ASCII format. Set format to 'b' if you want to specify a binary format, which is required for some utilities like the Heap Analysis Tool.
file=<filename>
Use the file option to change the name of the output file. The default name for an ASCII file is java.hprof.txt. The default name for a binary file is java.hprof.
force=y|n
Typically, the default (force=y) overwrites any existing information in the output file. So, if you have multiple JVMs running with HPROF enabled, use force=n, which appends additional characters to the output file name as needed.
net=<host>:<port>
To send the output over the network rather than to a local file, use the net option.
depth=<size>
The depth option indicates the number of method frames to display in a stack trace. The default is 4.
thread=y|n
If you set the thread option to y, the thread ID is printed next to each trace. This option is useful if you cannot see which thread is associated with which trace. This type of problem might occur in a multi-threaded application.
doe=y|n
The default behavior is to collect profile information when an application exits. To collect the profiling data during execution, set doe (dump on exit) to n.
msa=y|n
This feature is unsupported on IBM SDK platforms.
cutoff=<value>
Many sample entries are produced for a small percentage of the total execution time. By default, HPROF includes all execution paths that represent at least 0.0001 percent of the time spent by the processor. You can increase or decrease that cutoff point using this option. For example, to eliminate all entries that represent less than one-fourth of one percent of the total execution time, you specify cutoff=0.0025.
verbose=y|n
This option generates a message when dumps are taken. The default is y.
lineno=y|n
Each frame typically includes the line number that was processed, but you can use this option to suppress the line numbers from the output listing. If enabled, each frame contains the text Unknown line instead of the line number.

繼續看如何閱讀內容

https://www.ibm.com/docs/en/sdk-java-technology/8?topic=profiler-explanation-hprof-output-file