#!/bin/bash
                                        # в качестве изменяемой переменной используется кол-во параллельных потоков (numjobs)
TIME=60                                 # время замера одного профиля
SLEEP=5                                 # пауза между замерами
MAXTHREADS=256                          # макс. кол-во параллельных потоков, д.б. кратно 8, рекомендуемые значения от 32 до 256
DISK=/dev/vdb                           # имена дисков для тестирования - разделитель ":"

# -------- №1 -- bloсk=4K -- 100% random read -- iodepth=1 -----------------------
for ((p=1; p<=7; p++))
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

for p in `seq 8 8 $MAXTHREADS`
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

# -------- №2 -- block=4K -- 100% random write -- iodepth=1 -----------------------
for ((p=1; p<=7; p++))
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

for p in `seq 8 8 $MAXTHREADS`
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

# -------- №3 -- block=64K -- 100% sequential read -- iodepth=1 -----------------------
for ((p=1; p<=7; p++))
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

for p in `seq 8 8 $MAXTHREADS`
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

# -------- №4 -- block=64K -- 100% sequential write -- iodepth=1 -----------------------
for ((p=1; p<=7; p++))
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

for p in `seq 8 8 $MAXTHREADS`
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

# -------- №5 -- block=32K -- 100% sequential read -- iodepth=1 -----------------------
for ((p=1; p<=7; p++))
do
  NAME=1d-32k-read-1-$p
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
  --rw=read \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done

for p in `seq 8 8 $MAXTHREADS`
do
  NAME=1d-32k-read-1-$p
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
  --rw=read \
  --iodepth=1 \
  --numjobs=$p \
  --output=./out/$NAME.txt
  sleep $SLEEP
done
