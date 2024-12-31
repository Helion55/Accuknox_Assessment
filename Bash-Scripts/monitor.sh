# ! /usr/bin/env bash

cpu_float=$(top -b -n 1 | grep id, | awk '{print $8}')
free_memory=$(grep MemFree /proc/meminfo | awk '{print $2}')
total_memory=$(grep MemTotal /proc/meminfo | awk '{print $2}')
storage=$(df | grep /dev/sda3 | awk '{print $5}' | tr -d '%')

memory=$(($free_memory *100 / $total_memory))

cpu=${cpu_float%.*}
cpu_usage=$(( 100 - $cpu ))

# CPU Output

if [ $cpu -lt 20 ]
then
    echo "cpu limit exceeded .....!"
else
    echo "everything looks good, cpu usage is $cpu_usage %"
fi

# Memory Output

if [ $memory -gt 80 ] 
then
    echo "memory limit exceeded .....!"
else
    echo "everything looks good, memory usage is $memory %"
fi

#Storage Output 

if [ $storage -gt 80 ] 
then
    echo "memory limit exceeded .....!"
else
    echo "everything looks good, storage usage is $storage %"
fi