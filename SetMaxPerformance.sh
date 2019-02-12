#! /bin/bash
# /startup/SetMaxPerformance.sh

#update-rc.d -f ondemand remove
nvpmodel -m 0

echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo userspace > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo userspace > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo userspace > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo userspace > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo userspace > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor

sleep 2s

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq

#echo 0 > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable
for file in /sys/devices/system/cpu/cpu*/online; do
 if [ `cat $file` -eq 0 ]; then
 echo 1 > $file
 fi
done
#echo runnable > /sys/devices/system/cpu/cpuquiet/current_governor

#cat /sys/kernel/debug/clock/gpu_dvfs_t
#cat /sys/kernel/debug/clock/dvfs_table
#cat /sys/kernel/debug/clock/gbus/max > /sys/kernel/debug/clock/override.gbus/rate
#echo 1 > /sys/kernel/debug/clock/override.gbus/state

for i in `ls /sys/devices/system/cpu/cpu*/cpuidle/state*/disable`; do echo 1 > $i; done

#cat /sys/kernel/debug/clock/override.emc/max > /sys/kernel/debug/clock/override.emc/rate
#echo 1 > /sys/kernel/debug/clock/override.emc/state

echo 255 > /sys/kernel/debug/tegra_fan/target_pwm

cat /sys/devices/system/cpu/cpufreq/policy0/policy_max_freq > /sys/devices/system/cpu/cpufreq/policy0/policy_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy1/policy_max_freq > /sys/devices/system/cpu/cpufreq/policy1/policy_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq > /sys/devices/system/cpu/cpufreq/policy1/scaling_min_freq 

sleep 5s

cat /sys/devices/system/cpu/cpufreq/policy0/policy_max_freq > /sys/devices/system/cpu/cpufreq/policy0/policy_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy1/policy_max_freq > /sys/devices/system/cpu/cpufreq/policy1/policy_min_freq 
cat /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq > /sys/devices/system/cpu/cpufreq/policy1/scaling_min_freq 

