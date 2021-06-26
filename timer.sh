#!/bin/ksh
i=0

while(($i<100))

do

./cpu_mem_use.sh
sleep 360
let i=i+1

done