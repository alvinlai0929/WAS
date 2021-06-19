#!/bin/sh

#$WAS/java/bin/java -version -Xdump:what
#-Xdump:what通用 JVM 參數觀察默認配置 

java -version -Xdump:what

-Xdump:directory=/var/dumps/

#指定log存放位置