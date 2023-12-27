#!/bin/bash

disk_name=$1

first_file=10#$2

last_file=10#$3

for ((i=$first_file; i<=$last_file; i++)); do
  if [ $i -lt 10 ]
   then
   sed -i "s@filename=.*@filename=$disk_name@g" ./ini/progon0$i.ini
  else
   sed -i "s@filename=.*@filename=$disk_name@g" ./ini/progon$i.ini
  fi
done
