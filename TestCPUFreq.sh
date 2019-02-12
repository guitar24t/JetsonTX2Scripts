#! /bin/bash
# TestCPUFreq.sh

cat /sys/devices/system/cpu/cpufreq/policy0/policy_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy1/policy_min_freq 

for i in 0 1 2 3 4 5 ; do
	echo "CPU${i}: `cat /sys/devices/system/cpu/cpu${i}/cpufreq/scaling_cur_freq`"
done