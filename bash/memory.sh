#!/usr/bin/env bash

# Finds the memory usage statistic of a process
process_id=$1
echo $process_id

read mem rss < <(ps -p $process_id -o %mem,rss | tail -n 1)
declare mb=1024
rss_mb=$((rss / mb))

echo "Memory usage : " $mem "% of total memory"
echo "Ram used: " $rss_mb "Mb"
