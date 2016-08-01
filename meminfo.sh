#!/bin/bash

MemAvailable=$(( $(grep MemAvailable /proc/meminfo | awk '{print$2}') / 1024 ))
MemTotal=$(( $(grep MemTotal /proc/meminfo | awk '{print$2}') / 1024 ))
MemFree=$(( $(grep MemFree /proc/meminfo | awk '{print$2}') / 1024 ))
Buffers=$(( $(grep Buffers /proc/meminfo | awk '{print$2}') / 1024 ))
Cached=$(( $(egrep ^Cached /proc/meminfo | awk '{print$2}') / 1024 ))
MemTotal=$(( $(grep MemTotal /proc/meminfo | awk '{print$2}') / 1024 ))
SwapTotal=$(( $(grep SwapTotal /proc/meminfo | awk '{print$2}') / 1024 ))
SwapCached=$(( $(grep SwapCached /proc/meminfo | awk '{print$2}') / 1024 ))
SwapFree=$(( $(grep SwapFree /proc/meminfo | awk '{print$2}') / 1024 ))
Slab=$(( $(grep Slab /proc/meminfo | awk '{print$2}') / 1024 ))
SReclaimable=$(( $(grep SReclaimable /proc/meminfo | awk '{print$2}') / 1024 ))
SUnreclaim=$(( $(grep SUnreclaim /proc/meminfo | awk '{print$2}') / 1024 ))
PercentageUsed=$(( ($MemTotal - $MemAvailable) * 100 / $MemTotal ))
PercentageFree=$(( $MemAvailable * 100 / $MemTotal ))
if [[ $SwapTotal -eq 0 ]]
then
	SwapPercentageUsed=0
	SwapPercentageFree=0
else
	SwapPercentageUsed=$(( ($SwapTotal - $SwapFree) * 100 / $SwapTotal ))
	SwapPercentageFree=$(( $SwapFree * 100 / $SwapTotal ))
fi

echo "metric MemAvailable int $MemAvailable"
echo "metric MemTotal int $MemTotal"
echo "metric MemFree int $MemFree"
echo "metric Buffers int $Buffers"
echo "metric Cached int $Cached"
echo "metric MemTotal int $MemTotal"
echo "metric SwapTotal int $SwapTotal"
echo "metric SwapCached int $SwapCached"
echo "metric SwapFree int $SwapFree"
echo "metric Slab int $Slab"
echo "metric SReclaimable int $SReclaimable"
echo "metric SUnreclaim int $SUnreclaim"
echo "metric PercentageUsed int $PercentageUsed"
echo "metric PercentageFree int $PercentageFree"
echo "metric SwapPercentageUsed int $SwapPercentageUsed"
echo "metric SwapPercentageFree int $SwapPercentageFree"
