#!/bin/bash
prefix="temp="
suffix="'C"
vcgencmd_bin=$(/usr/bin/which vcgencmd)
gpu=$($vcgencmd_bin measure_temp)
gpu_temp=${gpu#$prefix}
gpu_temp=${gpu_temp%$suffix}
echo -e "{\"cpu\":"$(</sys/class/thermal/thermal_zone0/temp)", \"gpu\":$gpu_temp}"