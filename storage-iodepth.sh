#!/bin/bash
#for THREADS in `seq 4 4 $MAXTHREADS`

TIME=20
SLEEP=2
MAXTHREADS=32

# ------------ 1 disk -- bloсk=4K -- 100% random read -- variable iodepth -- 1 job -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-4k-randread-$p-1
  fio \
  --size=10g \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=/dev/vdb \
  --bs=4k \
  --rw=randread \
  --iodepth=$p \
  --numjobs=1 \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=4K -- 100% random write -- variable iodepth -- 1 job -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-4k-randwrite-$p-1
  fio \
  --size=10g \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=/dev/vdb \
  --bs=4k \
  --rw=randwrite \
  --iodepth=$p \
  --numjobs=1 \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=64K -- 100% sequential read -- variable iodepth -- 1 job -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-64k-read-$p-1
  fio \
  --size=10g \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=/dev/vdb \
  --bs=64k \
  --rw=read \
  --iodepth=$p \
  --numjobs=1 \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=64K -- 100% sequential write -- variable iodepth -- 1 job -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-64k-write-$p-1
  fio \
  --size=10g \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=/dev/vdb \
  --bs=64k \
  --rw=write \
  --iodepth=$p \
  --numjobs=1 \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=8K -- 50% random read 50% random write -- variable iodepth -- 1 job -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-8k-randrw-$p-1
  fio \
  --size=10g \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=/dev/vdb \
  --bs=8k \
  --rw=randrw \
  --iodepth=$p \
  --numjobs=1 \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=32K -- 50% sequential read 50% sequential write -- variable iodepth -- 1 job -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-32k-rw-$p-1
  fio \
  --size=10g \
  --direct=1 \
  --buffered=0 \
  --time_based \
  --runtime=$TIME \
  --ramp_time=5 \
  --ioengine=libaio \
  --group_reporting \
  --name=$NAME \
  --filename=/dev/vdb \
  --bs=32k \
  --rw=rw \
  --iodepth=$p \
  --numjobs=1 \
  --output=./out/$NAME.txt
  sleep $SLEEP
done
