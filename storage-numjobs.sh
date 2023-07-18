#!/bin/bash
#for THREADS in `seq 4 4 $MAXTHREADS`

TIME=60
SLEEP=5
MAXTHREADS=32
DISK=/dev/vdb

# ------------ 1 disk -- bloсk=4K -- 100% random read -- iodepth=1 -- variable numjobs -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-4k-randread-1-$p
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
  --filename=$DISK \
  --bs=4k \
  --rw=randread \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=4K -- 100% random write -- iodepth=1 -- variable numjobs -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-4k-randwrite-1-$p
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
  --filename=$DISK \
  --bs=4k \
  --rw=randwrite \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=64K -- 100% sequential read -- iodepth=1 -- variable numjobs -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-64k-read-1-$p
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
  --filename=$DISK \
  --bs=64k \
  --rw=read \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=64K -- 100% sequential write -- iodepth=1 -- variable numjobs -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-64k-write-1-$p
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
  --filename=$DISK \
  --bs=64k \
  --rw=write \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=8K -- 50% random read 50% random write -- iodepth=1 -- variable numjobs -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-8k-randrw-1-$p
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
  --filename=$DISK \
  --bs=8k \
  --rw=randrw \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

# ------------ 1 disk -- block=32K -- 50% sequential read 50% sequential write -- iodepth=1 -- variable numjobs -----------------------
for ((p=1; p<=$MAXTHREADS; p++))
do
  NAME=1d-32k-rw-1-$p
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
  --filename=$DISK \
  --bs=32k \
  --rw=rw \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done
